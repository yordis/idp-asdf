defmodule StrawHat.Idp.CommandHandler.CreateUserCommandHandler do
  @behaviour Commanded.Commands.Handler

  alias StrawHat.Idp.Command.CreateUserCommand
  alias StrawHat.Idp.Entity.UserEntity
  alias Commanded.Aggregate.Multi

  alias StrawHat.Idp.Event.{
    UserCreated,
    UserStaged,
    UserProvisioned,
    UserActivated,
    UserLoginVerified
  }

  def handle(%UserEntity{user_id: nil} = user, %CreateUserCommand{} = command) do
    user
    |> Multi.new()
    |> Multi.execute(&create_user(&1, command))
    |> Multi.execute(&verified_user_login(&1, command))
    |> Multi.execute(&add_user_status(&1, command))
  end

  defp create_user(_user, command) do
    %UserCreated{
      user_id: command.user_id,
      profile: command.profile
    }
  end

  defp add_user_status(_user, %{login_verified: false, activation_workflow: nil} = command) do
    %UserStaged{
      user_id: command.user_id
    }
  end

  defp add_user_status(_user, %{login_verified: true, activation_workflow: nil} = command) do
    %UserActivated{
      user_id: command.user_id
    }
  end

  defp add_user_status(_user, command) do
    %UserProvisioned{
      user_id: command.user_id,
      activation_workflow: command.activation_workflow
    }
  end

  defp verified_user_login(_user, %{login_verified: true} = command) do
    %UserLoginVerified{
      user_id: command.user_id
    }
  end

  defp verified_user_login(_user, _command) do
    []
  end
end
