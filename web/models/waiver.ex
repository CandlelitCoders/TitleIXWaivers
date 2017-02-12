defmodule TitleIxWaivers.Waiver do
  use TitleIxWaivers.Web, :model

  schema "waivers" do
    field :state, :string
    field :name, :string
    field :date_requested, Ecto.Date
    field :date_granted, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:state, :name, :date_requested, :date_granted])
    |> validate_required([:state, :name, :date_requested, :date_granted])
  end
end
