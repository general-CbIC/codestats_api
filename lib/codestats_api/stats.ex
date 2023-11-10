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

  @doc """
  Parses the user's data from the Code::Stats API.
  """
  @spec parse(map()) :: t()
  def parse(input) do
    %__MODULE__{
      user: input["user"],
      dates: CodestatsApi.Stats.Dates.parse(input["dates"]),
      languages: CodestatsApi.Stats.Languages.parse(input["languages"]),
      machines: CodestatsApi.Stats.Machines.parse(input["machines"]),
      new_xp: CodestatsApi.Stats.Xp.parse(input["new_xp"]),
      total_xp: CodestatsApi.Stats.Xp.parse(input["total_xp"])
    }
  end
end
