defmodule StrawHat.Idp.Command.CreateMagicLinkCommand do
  use StrawHat.Commanded.Command

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field(:user_id, :string)
    field(:token, :string)
    field(:ttl, :string)
    field(:email, :string)
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
