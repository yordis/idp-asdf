defmodule StrawHat.Commanded.Aggregate do
  @type t :: struct()

  @doc """
  Apply the event to the aggregate.
  """
  @callback apply(aggregate :: t(), event :: struct()) :: t()

  defmacro __using__(_opts \\ []) do
    quote do
      @behaviour StrawHat.Commanded.Aggregate
    end
  end
end
