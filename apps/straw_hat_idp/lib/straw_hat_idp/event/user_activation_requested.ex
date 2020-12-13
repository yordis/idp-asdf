defmodule StrawHat.Idp.Event.UserActivationRequested do
  use StrawHat.Idp.ValueObject

  alias StrawHat.Idp.ValueObject.ActivationWorkflow

  embedded_schema do
    field :user_id, :string
    embeds_one :activation_workflow, ActivationWorkflow
  end
end
