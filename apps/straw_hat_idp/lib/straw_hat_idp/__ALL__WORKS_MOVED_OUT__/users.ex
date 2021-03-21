defmodule StrawHat.Idp.Users do
  alias StrawHat.Idp.Application

  def create_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.CreateUserCommand.new()
    |> Application.dispatch()
  end

  def verify_user_login(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.VerifyUserLoginCommand.new()
    |> Application.dispatch()
  end

  def activate_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.ActivateUserCommand.new()
    |> Application.dispatch()
  end

  def deactivate_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.DeactivateUserCommand.new()
    |> Application.dispatch()
  end

  def suspend_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.SuspendUserCommand.new()
    |> Application.dispatch()
  end
end
