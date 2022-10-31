defmodule FmcdEtc do
  alias FmcdEtc.{Printer, FileHandler, Bundler}

  @moduledoc """
  Starting point for the application. Basic flow
   - file_handler will receive the input and create all segments
   - bundler will bundle all itinerary togehter
   - printer will print out the final output
  """
  def start(file) do
    case FileHandler.handle_file(file) do
      {:ok, segments} ->
        Bundler.bundle(segments) |> Printer.print()

      {:error, msg} ->
        msg
    end
  end
end
