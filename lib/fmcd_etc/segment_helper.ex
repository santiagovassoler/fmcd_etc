defmodule FmcdEtc.SegmentHelper do
  @moduledoc """
    A helper module to build common things around segments
    TODO: Probably will be good to create the whole segment map from here
    since they all share the same keys.
  """
  def format_date(date, time) do
    {:ok, date_time, _} = DateTime.from_iso8601(date <> " " <> time <> ":00Z")
    date_time
  end
end
