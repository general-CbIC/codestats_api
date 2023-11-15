defmodule CodestatsApi.Stats.Dates do
  @moduledoc """
  This map describes the amount of XP earned on each date.

  Date in format `YYYY-MM-DD` is used as a key, and the amount of XP earned on that date is used as a value.
  """
  @type t() :: %{String.t() => CodestatsApi.Stats.Xp.t()}

  @doc """
  Parses the dates from the user's data from the Code::Stats API.
  """
  @spec parse(map()) :: t()
  def parse(input) do
    input
    |> Enum.map(fn {date, xp} -> {date, CodestatsApi.Stats.Xp.parse(xp)} end)
    |> Enum.into(%{})
  end
end
