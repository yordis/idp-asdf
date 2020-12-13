defmodule StrawHat.Idp.Repo.Migrations.CreateMagicLinksTable do
  use Ecto.Migration

  def change do
    create table(:magic_links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, :string
      add :email, :string
      add :email_id, :string
      add :token, :string
      add :status, :string
      timestamps(type: :utc_datetime)
    end
  end
end
