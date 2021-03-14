defmodule StrawHat.Idp.Users do
  alias StrawHat.Idp.Application

  def create_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.CreateUserCommand.new()
    |> Application.dispatch()
  end

  def create_magic_link(attrs \\ %{}) do
    attrs
    |> Map.merge(%{token: "123", ttl: "123", email: "yordis@pepeg.com"})
    |> StrawHat.Idp.Command.CreateMagicLinkCommand.new()
    |> Application.dispatch()
  end

  def attach_email_to_magic_link(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.AttachEmailToMagicLinkCommand.new()
    |> Application.dispatch()
  end

  def consume_magic_link(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.ConsumeMagicLinkCommand.new()
    |> Application.dispatch()
  end

  def verify_user_login(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.VerifyUserLoginCommand.new()
    |> Application.dispatch()
  end

  def create_session_from_magic_link(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.CreateSessionFromMagicLinkCommand.new()
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

  def block_user(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.BlockUserCommand.new()
    |> Application.dispatch()
  end
end
