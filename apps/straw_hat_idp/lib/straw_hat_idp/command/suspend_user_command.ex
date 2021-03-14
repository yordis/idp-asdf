defmodule StrawHat.Idp.Command.SuspendUserCommand do
  use StrawHat.Idp.Command

  alias StrawHat.Idp.Helpers

  embedded_schema do
    field :user_id, :string
  end

  def new(attrs) do
    Helpers.Map.new(attrs, __MODULE__)
  end
end
