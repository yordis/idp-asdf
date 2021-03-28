defmodule StrawHat.Idp.ValueObject.UserProfile do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :login, :string
    field :display_name, :string
    field :photo_url, :string
  end
end
