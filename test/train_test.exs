defmodule TrainTest do
  use ExUnit.Case
  alias FmcdEtc.Train

  test "return Train struct with valid data" do
    line = "MAD 2023-02-17 17:00 -> SVQ 19:30"

    expected = %Train{
      index: "MAD",
      origin: "MAD",
      destination: "SVQ",
      departure: ~U[2023-02-17 17:00:00Z],
      arrival: ~U[2023-02-17 19:30:00Z]
    }

    assert Train.new(line, "SVQ") == expected
  end
end
