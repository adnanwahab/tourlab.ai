defmodule BluegreenWeb.HealthCheckController do
  use BluegreenWeb, :controller

  def index(conn, _params) do
    text(conn, "Healthy!")
  end
end
