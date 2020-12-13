defmodule StrawHat.Idp.Projectors.MagicLink do
  use Commanded.Projections.Ecto,
    application: StrawHat.Idp.Application,
    repo: StrawHat.Idp.Repo,
    name: __MODULE__

  #  alias StrawHat.Idp.Events.{MagicLinkCreated, MagicLinkEmailAttached, MagicLinkConsumed}
  #  alias StrawHat.Idp.Projections.MagicLink
  #
  #  project(%MagicLinkCreated{} = event, _metadata, fn multi ->
  #    Ecto.Multi.insert(multi, :magic_link, %MagicLink{
  #      id: event.magic_link_id,
  #      user_id: event.user_id,
  #      email: event.email,
  #      token: event.token,
  #      status: "PENDING"
  #    })
  #  end)
  #
  #  project(%MagicLinkEmailAttached{} = event, _metadata, fn multi ->
  #    case MagicLink.get_magic(event.magic_link_id) do
  #      nil ->
  #        {:error, :not_found}
  #
  #      magic_link ->
  #        changeset = Ecto.Changeset.change(magic_link, %{email_id: event.email_id, status: "SENT"})
  #        Ecto.Multi.update(multi, :magic_link, changeset)
  #    end
  #  end)
  #
  #  project(%MagicLinkConsumed{} = event, _metadata, fn multi ->
  #    case MagicLink.get_magic(event.magic_link_id) do
  #      nil ->
  #        {:error, :not_found}
  #
  #      magic_link ->
  #        changeset = Ecto.Changeset.change(magic_link, %{status: "CONSUMED"})
  #        Ecto.Multi.update(multi, :magic_link, changeset)
  #    end
  #  end)
end
