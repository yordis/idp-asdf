defmodule StrawHat.Idp.Command.AttachEmailToMagicLinkCommand do
  use StrawHat.Idp.Command

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field :user_id, :string
    field :email_id, :string
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
