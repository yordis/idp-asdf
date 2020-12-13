defmodule StrawHat.IdpWeb.Router do
  use StrawHat.IdpWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router
    forward "/sent_emails", Bamboo.SentEmailViewerPlug

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: StrawHat.IdpWeb.Telemetry)
    end
  end

  scope "/", StrawHat.IdpWeb do
    pipe_through(:api)

    scope "/users" do
      resources "/", UsersController, except: [:new, :edit], only: []
      post "/magic-link", UsersController, :magic_link
    end
  end
end
