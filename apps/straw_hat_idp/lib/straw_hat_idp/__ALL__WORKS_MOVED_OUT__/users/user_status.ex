defmodule StrawHat.Idp.ValueObject.UserStatus do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    field :value, Ecto.Enum, values: [:staged]
  end

  def new(:staged) do
    %__MODULE__{value: :staged}
  end
end
