defmodule StrawHat.Idp.Sessions.Token do
  use StrawHat.Idp.Aggregate

  embedded_schema do
    field :access_token, :string
    field :refresh_token, :string
    field :id_token, :string
    field :token_type, :string
    field :expires_at, :boolean
  end

  # {
  #   "access_token":"eyJz93a...k4laUWw",
  #   "refresh_token":"GEbRxBN...edjnXbL",
  #   "id_token":"eyJ0XAi...4faeEoQ",
  #   "token_type":"Bearer",
  #   "expires_in":86400
  # }
end
