defmodule StrawHat.Commanded.ValueObject do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      @derive Jason.Encoder
      @primary_key false
    end
  end
end
