defmodule StrawHat.Idp.Command.CreateUserCommand do
  use StrawHat.Idp.Command

  alias StrawHat.Idp.Helpers
  alias StrawHat.Idp.ValueObject.UserProfile
  alias StrawHat.Idp.ValueObject.ActivationWorkflow

  embedded_schema do
    field :user_id, :string
    field :login_verified, :boolean
    embeds_one :activation_workflow, ActivationWorkflow
    embeds_one :profile, UserProfile
  end

  def new(attrs) do
    attrs
    |> Helpers.Map.new(__MODULE__)
    |> Map.put(:user_id, Helpers.generate_uuid())
  end
end
