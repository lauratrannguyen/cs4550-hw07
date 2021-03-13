defmodule Events.Invites.Invite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invites" do
    field :comment, :string
    field :response, :string
    belongs_to :user, Events.Users.User
    belongs_to :post, Events.Posts.Post

    timestamps()
  end

  @doc false
  def changeset(invite, attrs) do
    invite
    |> cast(attrs, [:comment, :response, :user_id, :event_id])
    |> validate_required([:user_id, :event_id])
  end
end
