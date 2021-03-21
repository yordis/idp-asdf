defmodule StrawHat.Idp.Projectors.User do
  use Commanded.Projections.Ecto,
    application: StrawHat.Idp.Application,
    repo: StrawHat.Idp.Repo,
    name: __MODULE__

  #  alias StrawHat.Idp.Event.{UserCreated, UserEmailVerified}
  #  alias StrawHat.Idp.Projections.User
  #
  #  project(%UserCreated{} = event, _metadata, fn multi ->
  #    Ecto.Multi.insert(multi, :user, %User{
  #      id: event.user_id,
  #      email: event.email
  #    })
  #  end)
  #
  #  project(%UserEmailVerified{} = event, _metadata, fn multi ->
  #    case User.get_user(event.user_id) do
  #      nil ->
  #        {:error, :not_found}
  #
  #      user ->
  #        changeset = Ecto.Changeset.change(user, %{email_verified: true})
  #        Ecto.Multi.update(multi, :user, changeset)
  #    end
  #  end)
end
