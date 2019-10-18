defmodule Parker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Parker.Accounts.{User, Encryption}

  schema "users" do
    field :password_hash, :string
    field :username, :string
    field :email_hash, :string

    #Virtual fields
    field :email, :string, virtual: true
    field :email_confirmation, :string, virtual: true
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email])
    |> validate_required([:username])
    |> validate_required([:password])
    |> validate_required([:email])
    |> validate_length(:password, min: 8)
    |> validate_length(:username, min: 6)
    |> validate_confirmation(:password)
    |> validate_confirmation(:email)
    |> unique_constraint(:username)
    |> downcase
    |> encrypt_login
    |> unique_constraint(:email_hash)
  end

  defp downcase(changeset) do
    update_change(changeset, :username, &String.downcase/1)
    |> update_change(:username, &String.downcase/1)
  end


  defp encrypt_login(changeset) do
    changeset
    |> encrypt_field(:password, :password_hash)
    |> encrypt_field(:email, :email_hash)
  end

  defp encrypt_field(changeset, field, field_hash) do
    get_change(changeset, field)
    |> Encryption.hash_field
    |> (&(put_change(changeset, field_hash, &1))).()
  end

end



