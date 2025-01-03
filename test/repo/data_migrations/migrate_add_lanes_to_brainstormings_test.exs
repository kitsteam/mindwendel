defmodule Mindwendel.Repo.DataMigrations.MigrateAddLanesToBrainstormingsTest do
  Code.require_file("./priv/repo/data_migrations/migrate_add_lanes_to_brainstormings.exs")

  use Mindwendel.DataCase, async: true
  alias Mindwendel.Factory
  alias Mindwendel.Lanes
  alias Mindwendel.Repo.DataMigrations.MigrateAddLanesToBrainstormings

  setup do
    %{brainstorming: Factory.insert!(:brainstorming, lanes: [])}
  end

  describe "#run/0" do
    test "adds a lane for the existing brainstorming", %{
      brainstorming: existing_brainstorming
    } do
      MigrateAddLanesToBrainstormings.run()

      assert Lanes.get_lanes_for_brainstorming(existing_brainstorming.id) |> length == 1
    end
  end
end
