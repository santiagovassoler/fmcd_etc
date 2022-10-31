defmodule FlightTest do
  use ExUnit.Case
  alias FmcdEtc.Flight

  test "return Flight struct with valid data" do
    line = "SVQ 2023-03-02 06:40 -> BCN 09:10"

    expected = %Flight{
      index: "BCN",
      origin: "SVQ",
      destination: "BCN",
      departure: ~U[2023-03-02 06:40:00Z],
      arrival: ~U[2023-03-02 09:10:00Z]
    }

    assert Flight.new(line, "SVQ") == expected
  end
end
