defmodule StrawHat.Idp.Command.AttachEmailToMagicLinkCommand do
  use StrawHat.Commanded.Command, aggregate_identifier: :user_id

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field(:email_id, :string)
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
