defmodule FmcdEtc.Hotel do
  defstruct [:index, :destination, :arrival, :departure]

  def new(line, _base) do
    [destination, check_in, _arrow, check_out] = String.split(line)

    {:ok, check_in, _} = DateTime.from_iso8601(check_in <> " 23:59:59Z")
    {:ok, check_out, _} = DateTime.from_iso8601(check_out <> " 00:00:00Z")

    %__MODULE__{
      index: destination,
      destination: destination,
      arrival: check_in,
      departure: check_out
    }
  end
end
