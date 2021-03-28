defmodule StrawHat.Idp.Command.ConsumeMagicLinkCommand do
  use StrawHat.Commanded.Command, aggregate_identifier: :user_id

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field(:session_id, :string)
  end

  def new(attrs) do
    attrs
    |> Helpers.MapHelpers.new(__MODULE__)
    |> Map.put(:session_id, Helpers.generate_uuid())
  end
end
