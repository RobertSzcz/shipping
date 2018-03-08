defmodule Shipping.Driver.Events.VehiclePositionChanged do
  @fields [:uuid, :driver_id, :lat, :lng, :timestamp]

  @enforce_keys @fields
  defstruct @fields
end
