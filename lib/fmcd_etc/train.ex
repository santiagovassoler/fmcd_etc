defmodule FmcdEtc.Train do
  defstruct [:index, :origin, :destination, :departure, :arrival]

  def new(line, base) do
    [origin, departure, time_departure, _arrow, destination, time_arrival] = String.split(line)

    arrival = FmcdEtc.SegmentHelper.format_date(departure, time_arrival)
    departure = FmcdEtc.SegmentHelper.format_date(departure, time_departure)
    index = if base == destination, do: origin, else: destination

    %__MODULE__{
      index: index,
      origin: origin,
      destination: destination,
      departure: departure,
      arrival: arrival
    }
  end
end
