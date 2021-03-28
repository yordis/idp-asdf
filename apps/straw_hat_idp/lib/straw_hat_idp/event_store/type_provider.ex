defmodule StrawHat.Idp.EventStore.TypeProvider do
  @behaviour Commanded.EventStore.TypeProvider

  def to_struct(event_name) do
    raise ArgumentError,
          "#{inspect(event_name)} event name is not registered in the event type mapper." <>
            "Please visit #{inspect(__MODULE__)} to register new events."
  end

  def to_string(event_struct) do
    raise ArgumentError,
          "#{inspect(event_struct)} event is not registered in the event type mapper." <>
            "Please visit #{inspect(__MODULE__)} to register new events."
  end
end
