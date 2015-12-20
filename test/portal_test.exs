defmodule PortalTest do
  use ExUnit.Case

  test "shooting a door" do
    Portal.shoot :orange
    assert Portal.Door.get(:orange), []
  end

  test "creating a transfer" do
    create_transfer :orange, :blue, [1,2,3,4]
    assert Portal.Door.get(:orange), [1,2,3,4]
    assert Portal.Door.get(:blue), []
  end

  test "pushing right" do
    portal = create_transfer :orange, :blue, [1,2,3,4]
    Portal.push_right(portal)
    assert Portal.Door.get(:orange), [1,2,3]
    assert Portal.Door.get(:blue), [4]
  end

  test "pushing left" do
    portal = create_transfer :orange, :blue, [1,2,3,4]
    Portal.push_right(portal)
    Portal.push_right(portal)
    Portal.push_right(portal)
    assert Portal.Door.get(:orange), [1,2,3]
    assert Portal.Door.get(:blue), [4]
  end

  defp create_transfer(source, target, list) do
    Portal.shoot source
    Portal.shoot target
    Portal.transfer source, target, list
  end
end
