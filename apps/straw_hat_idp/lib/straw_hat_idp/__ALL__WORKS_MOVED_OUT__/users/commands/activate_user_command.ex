defmodule StrawHat.Idp.Command.ActivateUserCommand do
  use StrawHat.Commanded.Command

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field(:user_id, :string)
  end

  def new(attrs) do
    Helpers.MapHelpers.new(attrs, __MODULE__)
  end
end
