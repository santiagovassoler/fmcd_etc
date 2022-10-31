defmodule FmcdEtc.FileHandler do
  alias FmcdEtc.{Flight, Hotel, Train}

  @doc """
   Using Flow library we can get more performance because of its concurrency
   Probably an overkill for this project, it will all dpends how big the file
   cold get, otherwise using Stream will be enough.
  """
  def handle_file(file_stream) do
    case File.exists?(file_stream) do
      true ->
        file_stream
        |> File.stream!()
        |> Flow.from_enumerable()
        |> Flow.reject(&(&1 in ["RESERVATION\n", "\n"]))
        |> Flow.map(fn line -> String.trim(line, "\n") |> String.trim_leading("SEGMENT: ") end)
        |> build()
        |> Enum.to_list()
        |> list_segment()

      _ ->
        {:error, "File not found"}
    end
  end

  defp build(stream) do
    ["BASED: " <> base | _] = Enum.to_list(stream)
    Flow.map(stream, &create_segment(&1, base))
  end

  defp list_segment(["BASED: " <> _base | segments]), do: {:ok, segments}
  defp list_segment(_), do: {:error, "Invalid file: BASED is missing"}
  defp create_segment("Hotel " <> line, base), do: Hotel.new(line, base)
  defp create_segment("Flight " <> line, base), do: Flight.new(line, base)
  defp create_segment("Train " <> line, base), do: Train.new(line, base)
  defp create_segment(line, _), do: line
end
