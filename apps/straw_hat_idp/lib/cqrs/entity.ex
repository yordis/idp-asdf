defmodule StrawHat.Idp.Entity do
  def add_entity_id(command, value, key) do
    Map.put(command, key, value)
  end

  defmacro __using__(opts \\ []) do
    unless Keyword.has_key?(opts, :entity_identifier) do
      raise ArgumentError, "Missing :entity_identifier option"
    end

    entity_identifier = Keyword.fetch!(opts, :entity_identifier)

    quote do
      use Ecto.Schema
      alias StrawHat.Idp.Entity
      alias __MODULE__

      @entity_identifier_key unquote(entity_identifier)
      @primary_key {@entity_identifier_key, :binary_id, autogenerate: true}
      @derive Jason.Encoder

      def entity_identifier do
        @entity_identifier_key
      end

      def add_entity_id(entity, value) do
        Entity.add_entity_id(entity, value, @entity_identifier_key)
      end
    end
  end
end
