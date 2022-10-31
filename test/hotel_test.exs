defmodule HotelTest do
  use ExUnit.Case
  alias FmcdEtc.Hotel

  test "return Hotel struct with valid data" do
    line = "BCN 2023-01-05 -> 2023-01-10"

    expected = %Hotel{
      index: "BCN",
      destination: "BCN",
      arrival: ~U[2023-01-05 23:59:59Z],
      departure: ~U[2023-01-10 00:00:00Z]
    }

    assert Hotel.new(line, expected.destination) == expected
  end
end
