defmodule TitleIxWaivers.Repo.Migrations.AddDefaultValuesToWaiverTimestamps do
  use Ecto.Migration

  def up do
    alter table(:waivers) do
      modify :inserted_at, :datetime, default: "NOW()"
      modify :updated_at, :datetime, default: "NOW()"
    end
  end

  def down do
    alter table(:waivers) do
      modify :inserted_at, :datetime
      modify :updated_at, :datetime
    end
  end
end
