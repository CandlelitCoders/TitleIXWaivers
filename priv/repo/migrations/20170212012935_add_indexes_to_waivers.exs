defmodule TitleIxWaivers.Repo.Migrations.AddIndexesToWaivers do
  use Ecto.Migration

  def change do
    create index(:waivers, :state)
    create index(:waivers, :name)
    create index(:waivers, :date_requested)
    create index(:waivers, :date_granted)
  end
end
