defmodule CodestatsApi.Stats do
  @type t() :: %__MODULE__{
          user: String.t(),
          dates: CodestatsApi.Stats.Dates.t(),
          languages: CodestatsApi.Stats.Languages.t(),
          machines: CodestatsApi.Stats.Machines.t(),
          new_xp: CodestatsApi.Stats.Xp.t(),
          total_xp: CodestatsApi.Stats.Xp.t()
        }

  defstruct user: "", dates: %{}, languages: %{}, machines: %{}, new_xp: 0, total_xp: 0
end
