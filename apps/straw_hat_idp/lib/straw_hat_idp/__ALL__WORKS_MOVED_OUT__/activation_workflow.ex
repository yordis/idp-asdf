defmodule StrawHat.Idp.ValueObject.ActivationWorkflow do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :magic_link, :boolean
  end
end
