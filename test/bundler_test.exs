defmodule BundlerTest do
  use ExUnit.Case
  alias FmcdEtc.Bundler

  test "test group trip segments" do
    stream = [
      %FmcdEtc.Flight{
        index: "BCN",
        origin: "SVQ",
        destination: "BCN",
        departure: ~U[2023-01-05 20:40:00Z],
        arrival: ~U[2023-01-05 22:10:00Z]
      },
      %FmcdEtc.Hotel{
        index: "BCN",
        destination: "BCN",
        arrival: ~U[2023-01-05 23:59:59Z],
        departure: ~U[2023-01-10 00:00:00Z]
      },
      %FmcdEtc.Flight{
        index: "BCN",
        origin: "BCN",
        destination: "SVQ",
        departure: ~U[2023-01-10 10:30:00Z],
        arrival: ~U[2023-01-10 11:50:00Z]
      },
      %FmcdEtc.Train{
        index: "MAD",
        origin: "SVQ",
        destination: "MAD",
        departure: ~U[2023-02-15 09:30:00Z],
        arrival: ~U[2023-02-15 11:00:00Z]
      },
      %FmcdEtc.Hotel{
        index: "MAD",
        destination: "MAD",
        arrival: ~U[2023-02-15 23:59:59Z],
        departure: ~U[2023-02-17 00:00:00Z]
      },
      %FmcdEtc.Train{
        index: "MAD",
        origin: "MAD",
        destination: "SVQ",
        departure: ~U[2023-02-17 17:00:00Z],
        arrival: ~U[2023-02-17 19:30:00Z]
      },
      %FmcdEtc.Flight{
        index: "BCN",
        origin: "SVQ",
        destination: "BCN",
        departure: ~U[2023-03-02 06:40:00Z],
        arrival: ~U[2023-03-02 09:10:00Z]
      },
      %FmcdEtc.Flight{
        index: "NYC",
        origin: "BCN",
        destination: "NYC",
        departure: ~U[2023-03-02 15:00:00Z],
        arrival: ~U[2023-03-02 22:45:00Z]
      }
    ]

    expected = %{
      "BCN" => [
        %FmcdEtc.Flight{
          index: "BCN",
          origin: "SVQ",
          destination: "BCN",
          departure: ~U[2023-01-05 20:40:00Z],
          arrival: ~U[2023-01-05 22:10:00Z]
        },
        %FmcdEtc.Hotel{
          index: "BCN",
          destination: "BCN",
          arrival: ~U[2023-01-05 23:59:59Z],
          departure: ~U[2023-01-10 00:00:00Z]
        },
        %FmcdEtc.Flight{
          index: "BCN",
          origin: "BCN",
          destination: "SVQ",
          departure: ~U[2023-01-10 10:30:00Z],
          arrival: ~U[2023-01-10 11:50:00Z]
        }
      ],
      "MAD" => [
        %FmcdEtc.Train{
          index: "MAD",
          origin: "SVQ",
          destination: "MAD",
          departure: ~U[2023-02-15 09:30:00Z],
          arrival: ~U[2023-02-15 11:00:00Z]
        },
        %FmcdEtc.Hotel{
          index: "MAD",
          destination: "MAD",
          arrival: ~U[2023-02-15 23:59:59Z],
          departure: ~U[2023-02-17 00:00:00Z]
        },
        %FmcdEtc.Train{
          index: "MAD",
          origin: "MAD",
          destination: "SVQ",
          departure: ~U[2023-02-17 17:00:00Z],
          arrival: ~U[2023-02-17 19:30:00Z]
        }
      ],
      "NYC" => [
        %FmcdEtc.Flight{
          index: "NYC",
          origin: "SVQ",
          destination: "BCN",
          departure: ~U[2023-03-02 06:40:00Z],
          arrival: ~U[2023-03-02 09:10:00Z]
        },
        %FmcdEtc.Flight{
          index: "NYC",
          origin: "BCN",
          destination: "NYC",
          departure: ~U[2023-03-02 15:00:00Z],
          arrival: ~U[2023-03-02 22:45:00Z]
        }
      ]
    }

    assert expected == Bundler.group(stream)
  end
end
