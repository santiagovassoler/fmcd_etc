defmodule FmcdEtc.Printer do
  alias FmcdEtc.{Hotel, Flight, Train}

  def print(segments) do
    segments
    |> Enum.reduce([], fn seg, acc -> [display(seg) | acc] end)
    |> Enum.reverse()
  end

  def display({key, list}) do
    "TRIP TO #{key}\n" <>
      Enum.reduce(list, "", fn segment, acc ->
        acc <> format(segment)
      end) <> "\n"
  end

  def format(%Flight{} = flight) do
    "Flight from #{flight.origin} to #{flight.destination} at #{Date.to_string(flight.departure)} #{format_time(flight.departure)} to #{format_time(flight.arrival)}\n"
  end

  def format(%Hotel{} = hotel) do
    "Hotel at #{hotel.destination} on #{Date.to_string(hotel.arrival)} to #{Date.to_string(hotel.departure)}\n"
  end

  def format(%Train{} = train) do
    "Train from #{train.origin} to #{train.destination} at #{Date.to_string(train.departure)} #{format_time(train.departure)} to #{format_time(train.arrival)}\n"
  end

  defp format_time(date), do: Calendar.strftime(date, "%H:%M")
end
