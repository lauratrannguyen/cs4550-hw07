defmodule Events.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites) do
      add :post_id, references(:posts), null: false
      add :user_id, references(:users), null: false
      add :response, :text
      add :comment, :text

      timestamps()
    end

  end
end
