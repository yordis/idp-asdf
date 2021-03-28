defmodule StrawHat.Commanded.CommandHandler do
  defmacro __using__(_opts \\ []) do
    quote do
      alias Commanded.Aggregate.Multi
    end
  end
end
