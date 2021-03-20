defmodule StrawHat.Idp.Projections.MagicLink do
  use StrawHat.Idp.Projections.Schema
  alias StrawHat.Idp.Projections.MagicLink
  alias StrawHat.Idp.Repo

  schema "magic_links" do
    field :user_id, :string
    field :email, :string
    field :email_id, :string
    field :token, :string
    field :status, :string
    timestamps()
  end

  def get_magic(magic_link_id) do
    Repo.get(MagicLink, magic_link_id)
  end

  def get_magic_link_by_token(token) do
    Repo.get_by(MagicLink, token: token)
  end
end
