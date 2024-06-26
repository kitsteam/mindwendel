defmodule MindwendelWeb.StaticPageController do
  use MindwendelWeb, :controller
  alias Mindwendel.Brainstormings
  alias Mindwendel.Brainstormings.Brainstorming

  plug :put_root_layout, {MindwendelWeb.LayoutView, :kits_static_page}

  def home(conn, _params) do
    current_user =
      conn
      |> Mindwendel.Services.SessionService.get_current_user_id()
      |> Mindwendel.Accounts.get_user()

    conn
    |> put_layout(false)
    |> render(
      "kits_home.html",
      current_user: current_user,
      brainstorming: %Brainstorming{},
      changeset: Brainstormings.change_brainstorming(%Brainstorming{}, %{})
    )
  end
end
