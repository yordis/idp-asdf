defmodule StrawHat.Idp.TestSupport.AggregateCase.BDDState do
  defstruct [:initial_events, :commands, :expected_events]

  def new() do
    %__MODULE__{
      initial_events: [],
      commands: [],
      expected_events: []
    }
  end

  def given_events(events \\ []) do
    new() |> given_events(events)
  end

  def given_events(state, events) do
    Map.merge(state, %{
      initial_events: state.initial_events ++ List.wrap(events)
    })
  end

  def when_commands(commands) do
    new() |> when_commands(commands)
  end

  def when_commands(state, commands) do
    Map.merge(state, %{
      commands: state.commands ++ List.wrap(commands)
    })
  end

  def then_events(state, events) do
    Map.merge(state, %{
      expected_events: state.expected_events ++ List.wrap(events)
    })
  end
end
