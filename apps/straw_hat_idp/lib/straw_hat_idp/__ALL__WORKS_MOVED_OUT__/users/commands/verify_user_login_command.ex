defmodule StrawHat.Idp.Command.VerifyUserLoginCommand do
  use StrawHat.Commanded.Command, aggregate_identifier: :user_id

  alias StrawHat.Idp.Helpers

  embedded_schema do
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
