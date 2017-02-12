defmodule TitleIxWaivers.Repo.Migrations.AddFormAndResponseToWaiver do
  use Ecto.Migration

  def up do
    alter table(:waivers) do
      add :waiver_request_form, :string
      add :waiver_response_letter, :string
    end
  end
end
