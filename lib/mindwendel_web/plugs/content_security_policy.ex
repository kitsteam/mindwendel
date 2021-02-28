defmodule Mindwendel.Plugs.ContentSecurityPolicy do
  @moduledoc """
  Allows affected ressources to be opened as an iframe by slides.com.
  """
  alias Plug.Conn

  def init(opts \\ %{}), do: Enum.into(opts, %{})

  def call(conn, _opts) do
    Conn.put_resp_header(conn, "Content-Security-Policy", "frame-ancestors https://slides.com")
  end
end
