  # Code attribution to Nat Tuck's Lecture 11 notes
  defmodule EventsWeb.SessionController do
    use EventsWeb, :controller
  
    def create(conn, %{"name" => name}) do
      user = Events.Users.get_user_by_name(name)
      if user do
        conn
        |> put_session(:user_id, user.id)
        |> put_flash(:info, "Welcome back #{user.name}")
        |> redirect(to: Routes.page_path(conn, :index))
      else
        conn
        |> put_flash(:error, "Login failed. Are you registered?")
        |> redirect(to: Routes.page_path(conn, :index))
      end
    end
  
    def delete(conn, _params) do
      conn
      |> delete_session(:user_id)
      |> put_flash(:info, "Logged out.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end
  