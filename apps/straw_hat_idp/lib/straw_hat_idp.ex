defmodule StrawHat.Idp do
  use Application

  def start(_type, _args) do
    StrawHat.Idp.Supervisor.start_link()
  end
end
