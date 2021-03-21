defmodule StrawHat.Commanded.CommandHandler do
  defmacro __using__(opts \\ []) do
    quote do
      use StrawHat.Commanded.CommandHandler
      alias Commanded.Aggregate.Multi
    end
  end
end
