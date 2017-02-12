defmodule TitleIxWaivers.Waiver do
  use TitleIxWaivers.Web, :model
  use Arc.Ecto.Schema

  schema "waivers" do
    field :state, :string
    field :name, :string
    field :date_requested, Ecto.Date
    field :date_granted, Ecto.Date
    field :waiver_request_form, TitleIxWaivers.WaiverRequestForm.Type
    field :waiver_response_letter, TitleIxWaivers.WaiverResponseLetter.Type

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:state, :name, :date_requested, :date_granted])
    |> cast_attachments(params, [:waiver_request_form, :waiver_response_letter])
    |> validate_required([:state, :name, :date_requested, :date_granted])
  end
end
