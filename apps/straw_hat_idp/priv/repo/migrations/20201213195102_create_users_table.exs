defmodule StrawHat.Idp.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :display_name, :string
      add :email_verified, :boolean
      timestamps(type: :utc_datetime)
    end
  end
end
