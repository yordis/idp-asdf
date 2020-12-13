defmodule StrawHat.Idp.TestSupport.AggregateCase do
  use ExUnit.CaseTemplate

  alias StrawHat.Idp.TestSupport.AggregateCase.BDDState

  using aggregate: aggregate do
    quote bind_quoted: [aggregate: aggregate] do
      @aggregate_module aggregate

      import StrawHat.Idp.TestSupport.Factory

      defp given_events(events \\ []), do: BDDState.given_events(events)
      defp given_events(state, events), do: BDDState.given_events(state, events)

      defp when_commands(commands), do: BDDState.when_commands(commands)
      defp when_commands(state, commands), do: BDDState.when_commands(state, commands)

      defp then_events(state, events), do: BDDState.then_events(state, events)

      defp assert_case(state) do
        {_aggregate, events, error} =
          @aggregate_module
          |> struct()
          |> apply_events(state.initial_events)
          |> execute_commands(state.commands)

        actual_events = List.wrap(events)

        assert is_nil(error)
        assert state.expected_events == actual_events
      end

      defp assert_error(state, expected_error) do
        {_aggregate, _events, error} =
          @aggregate_module
          |> struct()
          |> apply_events(state.initial_events)
          |> execute_commands(state.commands)

        assert error == expected_error
      end

      # Execute one or more commands against an aggregate
      defp execute_commands(aggregate, commands) do
        commands
        |> List.wrap()
        |> Enum.reduce({aggregate, [], nil}, &execute_command/2)
      end

      defp execute_command(command, {aggregate, _events, nil}) do
        case @aggregate_module.execute(aggregate, command) do
          {:error, reason} = error -> {aggregate, nil, error}
          events -> {apply_events(aggregate, events), events, nil}
        end
      end

      defp execute_command(_command, {aggregate, _events, _error} = reply) do
        reply
      end

      # Apply the given events to the aggregate state
      defp apply_events(aggregate, events) do
        events
        |> List.wrap()
        |> Enum.reduce(aggregate, &@aggregate_module.apply(&2, &1))
      end
    end
  end
end
