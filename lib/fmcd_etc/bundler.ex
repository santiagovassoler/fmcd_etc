defmodule FmcdEtc.Bundler do
  def bundle(segment) do
    segment
    |> Enum.sort_by(& &1.departure, DateTime)
    |> group()
  end

  def connection?(seg1, seg2), do: DateTime.diff(seg2.departure, seg1.arrival, :hour) < 24

  @doc """
   There is probably a more eficient way perhaps using Enum.chunck_while
   as seen https://hexdocs.pm/elixir/1.12/Enum.html#chunk_while/4
   Assuming the list is not too big this is the simplest way
  """
  def group(segments) do
    segments
    |> Enum.chunk_every(2, 1)
    |> Enum.map(fn
      [prev, next] ->
        case connection?(prev, next) do
          true -> Map.put(prev, :index, next.destination)
          _ -> prev
        end

      [prev] ->
        prev
    end)
    |> Enum.group_by(fn segment -> segment.index end, fn segment -> segment end)
  end
end
