defmodule StrawHat.Idp.Entity.MagicLinkEntity do
  use StrawHat.Idp.Entity, entity_identifier: :user_id

  embedded_schema do
    field :token, :string
    field :ttl, :string
  end

  def apply(magic_link, event) do
    IO.inspect(event)
    magic_link
  end
end
