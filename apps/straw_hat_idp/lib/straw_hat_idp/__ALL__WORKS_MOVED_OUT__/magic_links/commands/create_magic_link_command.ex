defmodule StrawHat.Idp.Command.CreateMagicLinkCommand do
  use StrawHat.Commanded.Command, aggregate_identifier: :user_id

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field(:token, :string)
    field(:ttl, :string)
    field(:email, :string)
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
