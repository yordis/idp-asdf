defmodule StrawHat.Idp.Helpers do
  defmodule MapHelpers do
    def new(attrs, target) do
      struct(target, attrs)
    end

    def convert_to(%_{} = source, target) do
      struct(target, Map.from_struct(source))
    end
  end

  def generate_uuid do
    UUID.uuid4()
  end
end
