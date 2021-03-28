defmodule StrawHat.Idp.Event.UserProvisioned do
  use StrawHat.Commanded.ValueObject

  embedded_schema do
    field :user_id, :string
    embeds_one :activation_workflow, ActivationWorkflow
  end
end
