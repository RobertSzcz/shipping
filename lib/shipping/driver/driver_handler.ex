defmodule Shipping.Driver.DriverHandler do
  @moduledoc ~S"""
  Functions for handling drivers' commands and events.
  """

  alias Shipping.Driver.Events.LoadRequestSent
  alias Shipping.Driver.Events.VehiclePositionChanged

  def send_load_request(driver_id, load_id) do
    event = %LoadRequestSent{
      uuid: UUID.uuid4(),
      driver_id: driver_id,
      load_id: load_id,
      timestamp: :os.system_time(:milli_seconds)
    }

    {:ok, event}
  end

  def change_vehicle_position(%{lat: lat, lng: lng, driver_id: driver_id}) do
    event = %VehiclePositionChanged{
      uuid: UUID.uuid4(),
      driver_id: driver_id,
      lat: lat,
      lng: lng,
      timestamp: :os.system_time(:milli_seconds)
    }

    {:ok, event}
  end
end
