defmodule CodestatsApi.Stats.Dates do
  @typedoc """
  This map describes the amount of XP earned on each date.

  Date in format `YYYY-MM-DD` is used as a key, and the amount of XP earned on that date is used as a value.
  """
  @type t() :: %{String.t() => CodestatsApi.Stats.Xp.t()}
end
