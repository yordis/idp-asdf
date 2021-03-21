defmodule StrawHat.Commanded.Aggregate do
  @doc """
  Apply the event to the aggregate.
  """
  @callback apply(%__MODULE__{}, event) :: %__MODULE__{}

  defmacro __using__(opts \\ []) do
    quote do
      @behaviour StrawHat.Commanded.Aggregate
    end
  end
end
