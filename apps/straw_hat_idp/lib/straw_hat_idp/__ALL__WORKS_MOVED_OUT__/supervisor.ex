defmodule StrawHat.Idp.Supervisor do
  use Supervisor

  def start_link(arg \\ []) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      StrawHat.Idp.Repo,
      StrawHat.Idp.Application,
      StrawHat.Idp.EventHandlers.PasswordlessWorkflow,
      #      StrawHat.Idp.Projectors.User,
      #      StrawHat.Idp.Projectors.MagicLink,
      {Phoenix.PubSub, name: StrawHat.Idp.PubSub}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
