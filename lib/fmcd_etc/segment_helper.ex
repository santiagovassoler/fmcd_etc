defmodule FmcdEtc.SegmentHelper do
  def format_date(date, time) do
    {:ok, date_time, _} = DateTime.from_iso8601(date <> " " <> time <> ":00Z")
    date_time
  end
end
