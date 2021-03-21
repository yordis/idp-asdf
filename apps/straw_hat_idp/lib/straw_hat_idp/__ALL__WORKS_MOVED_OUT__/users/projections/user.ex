defmodule StrawHat.Idp.Projections.User do
  use StrawHat.Idp.Projections.Schema
  alias StrawHat.Idp.Projections.User
  alias StrawHat.Idp.Repo

  schema "users" do
    field :email, :string
    field :display_name, :string
    field :email_verified, :boolean
    timestamps()
  end

  def get_user(uuid) do
    Repo.get(User, uuid)
  end
end
