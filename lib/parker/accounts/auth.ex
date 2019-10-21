defmodule Parker.Accounts.Auth do
  alias Parker.Accounts.{Encryption, User}


#  def login(username, password) do
#    user = repo.get_by(User, username: String.downcase(username))
#    case authenticate(user, password) do
#      true -> {:ok, user}
#      _    -> :error
#    end
#  end

  def pubAuth(user, password) do
    authenticate(user, password)
  end

  defp authenticate(user, password) do
    if user do
      {:ok, authenticated_user} = Encryption.validate_against_hash(user, password)
    else
      {:error, "Invalid username or password."}
    end
  end

  def signed_in?(conn) do
    conn.assigns[:current_user]
  end
end
