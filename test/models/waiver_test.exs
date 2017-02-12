defmodule TitleIxWaivers.WaiverTest do
  use TitleIxWaivers.ModelCase

  alias TitleIxWaivers.Waiver

  @valid_attrs %{date_granted: %{day: 17, month: 4, year: 2010}, date_requested: %{day: 17, month: 4, year: 2010}, name: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Waiver.changeset(%Waiver{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Waiver.changeset(%Waiver{}, @invalid_attrs)
    refute changeset.valid?
  end
end
