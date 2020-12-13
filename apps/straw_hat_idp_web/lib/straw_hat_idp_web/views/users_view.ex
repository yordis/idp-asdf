defmodule StrawHat.IdpWeb.UsersView do
  use StrawHat.IdpWeb, :view
  alias StrawHat.IdpWeb.UsersView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id, display_name: users.display_name}
  end
end
