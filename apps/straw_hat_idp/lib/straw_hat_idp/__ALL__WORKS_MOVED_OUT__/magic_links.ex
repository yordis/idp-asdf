defmodule StrawHat.Idp.MagicLinks do
  alias StrawHat.Idp.Application

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

  def create_session_from_magic_link(attrs \\ %{}) do
    attrs
    |> StrawHat.Idp.Command.CreateSessionFromMagicLinkCommand.new()
    |> Application.dispatch()
  end
end
