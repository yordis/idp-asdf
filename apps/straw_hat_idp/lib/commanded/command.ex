defmodule StrawHat.Commanded.Command do
  def add_aggregate_id(command, value, key) do
    Map.put(command, key, value)
  end

  defmacro __using__(opts \\ []) do
    unless Keyword.has_key?(opts, :aggregate_identifier) do
      raise ArgumentError, "Missing :aggregate_identifier option"
    end

    aggregate_identifier = Keyword.fetch!(opts, :aggregate_identifier)

    quote do
      use Ecto.Schema
      alias StrawHat.Commanded.Command

      @aggregate_identifier_key unquote(aggregate_identifier)
      @primary_key {@aggregate_identifier_key, :binary_id, autogenerate: true}
      @derive Jason.Encoder

      def aggregate_identifier do
        @aggregate_identifier_key
      end

      def add_aggregate_id(command, value) do
        Command.add_aggregate_id(command, value, @aggregate_identifier_key)
      end
    end
  end
end
