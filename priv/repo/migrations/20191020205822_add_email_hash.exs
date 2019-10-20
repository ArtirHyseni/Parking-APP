defmodule Parker.Repo.Migrations.AddEmailHash do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :email_hash, :string
    end

  end
end
