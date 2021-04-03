defmodule StrawHat.Idp.ValueObject.UserProfile do
  use StrawHat.Commanded.ValueObject

#  https://openid.net/specs/openid-connect-core-1_0.html#ScopeClaims

  embedded_schema do
    field :login, :string
    field :display_name, :string
    field :photo_url, :string
  end
end
