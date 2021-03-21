defmodule StrawHat.Idp.Projections.Schema do
  defmacro __using__(_opts) do
    quote do
      use Ecto.Schema
      import Ecto.Changeset

      @primary_key {:id, :binary_id, autogenerate: false}
      @foreign_key_type :binary_id
      @timestamps_opts [type: :utc_datetime, usec: true]
    end
  end
end
