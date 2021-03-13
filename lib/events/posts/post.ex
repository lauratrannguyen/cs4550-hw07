defmodule Events.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    belongs_to :user, Events.Users.User
    has_many :invites, Events.Invites.Invite

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :date_time, :user_id])
    |> validate_required([:name, :description, :date_time, :user_id])
  end
end
