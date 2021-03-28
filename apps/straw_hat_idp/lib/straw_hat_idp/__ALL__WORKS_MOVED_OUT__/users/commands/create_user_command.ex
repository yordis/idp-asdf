defmodule StrawHat.Idp.Command.CreateUserCommand do
  use StrawHat.Commanded.Command, aggregate_identifier: :user_id

  alias StrawHat.Idp.Helpers
  alias StrawHat.Idp.ValueObject.UserProfile
  alias StrawHat.Idp.ValueObject.ActivationWorkflow

  embedded_schema do
    field(:login_verified, :boolean)
    embeds_one(:activation_workflow, ActivationWorkflow)
    embeds_one(:profile, UserProfile)
  end

  def new(attrs) do
    attrs
    |> Helpers.MapHelpers.new(__MODULE__)
    |> Map.put(:user_id, Helpers.generate_uuid())
  end
end
