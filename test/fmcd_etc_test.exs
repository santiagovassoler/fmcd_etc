defmodule FmcdEtcTest do
  use ExUnit.Case
  doctest FmcdEtc

  test "retunrs a final parsed itinerary" do
    filename = "lib/bookings/input.txt"

    expected = [
      "TRIP TO BCN\nFlight from SVQ to BCN at 2023-01-05 20:40 to 22:10\nHotel at BCN on 2023-01-05 to 2023-01-10\nFlight from BCN to SVQ at 2023-01-10 10:30 to 11:50\n\n",
      "TRIP TO MAD\nTrain from SVQ to MAD at 2023-02-15 09:30 to 11:00\nHotel at MAD on 2023-02-15 to 2023-02-17\nTrain from MAD to SVQ at 2023-02-17 17:00 to 19:30\n\n",
      "TRIP TO NYC\nFlight from SVQ to BCN at 2023-03-02 06:40 to 09:10\nFlight from BCN to NYC at 2023-03-02 15:00 to 22:45\n\n"
    ]

    assert expected == FmcdEtc.start(filename)
  end
end
