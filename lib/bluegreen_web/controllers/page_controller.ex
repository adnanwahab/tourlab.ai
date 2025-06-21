defmodule BluegreenWeb.PageController do
  use BluegreenWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def resend_email(conn, %{"email" => email}) do
    email = Swoosh.Email.new()
      |> Swoosh.Email.to(email)
      |> Swoosh.Email.from({"TourLab", "learnmath.fyi"})
      |> Swoosh.Email.subject("Resend Email Test")
      |> Swoosh.Email.text_body("This is a test resend email.")

    Bluegreen.Mailer.deliver(email)
    json(conn, %{message: "If the email exists, a message was sent."})
  end
end
