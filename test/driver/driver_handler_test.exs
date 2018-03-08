defmodule Shipping.Driver.DriverHandlerTest do
  use ExUnit.Case, async: true

  alias Shipping.Driver.DriverHandler

  alias Shipping.Driver.Events.LoadRequestSent
  alias Shipping.Driver.Events.VehiclePositionChanged

  test "send_load_request returns correct event" do
    {:ok, event} = DriverHandler.send_load_request("driver_id", "load_id")

    assert %LoadRequestSent{driver_id: "driver_id", load_id: "load_id", uuid: _, timestamp: _} =
             event
  end

  test "change_vehicle_position returns correct event" do
    {:ok, event} = DriverHandler.change_vehicle_position(%{lat: 10.0, lng: 10.0, driver_id: "driver_id"})

    assert %VehiclePositionChanged{lat: 10.0, lng: 10.0, driver_id: "driver_id", uuid: _, timestamp: _} =
             event
  end
end
