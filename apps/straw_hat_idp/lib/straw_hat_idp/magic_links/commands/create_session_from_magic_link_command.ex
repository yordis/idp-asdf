defmodule StrawHat.Idp.Command.CreateSessionFromMagicLinkCommand do
  use StrawHat.Idp.Command

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field :user_id, :string
    field :session_id, :string
    field :access_token, :string
    field :refresh_token, :string
  end

  def new(attrs) do
    attrs
    |> Helpers.MapHelpers.new(__MODULE__)
    |> Map.put(:session_id, Helpers.generate_uuid())
  end
end
