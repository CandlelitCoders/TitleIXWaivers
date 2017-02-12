defmodule TitleIxWaivers.Repo.Migrations.CreateWaiver do
  use Ecto.Migration

  def change do
    create table(:waivers) do
      add :state, :string
      add :name, :string
      add :date_requested, :date
      add :date_granted, :date

      timestamps()
    end

  end
end
