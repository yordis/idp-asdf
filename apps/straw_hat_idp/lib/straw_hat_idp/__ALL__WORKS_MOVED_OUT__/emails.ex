defmodule StrawHat.Idp.Emails do
  import Bamboo.Email
  alias StrawHat.Idp.Mailer

  def magic_link(email, token) do
    email =
      base_email()
      |> to(email)
      |> subject("New Magic Link token!!!")
      |> put_header("Reply-To", "someone@example.com")
      |> html_body("Here is your token <strong>#{token}</strong>")
      |> text_body("Here is your token #{token}")
      |> Mailer.deliver_now()

    {:ok, %{email_id: UUID.uuid4(), email: email}}
  end

  defp base_email do
    new_email() |> from("myapp@example.com")
  end
end
