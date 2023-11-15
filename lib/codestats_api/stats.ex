defmodule CodestatsAPI.Stats do
  @moduledoc """
  Structure containing all the user's stats.
  """
  @type t() :: %__MODULE__{
          user: String.t(),
          dates: CodestatsAPI.Stats.Dates.t(),
          languages: CodestatsAPI.Stats.Languages.t(),
          machines: CodestatsAPI.Stats.Machines.t(),
          new_xp: CodestatsAPI.Stats.Xp.t(),
          total_xp: CodestatsAPI.Stats.Xp.t()
        }

  defstruct user: "", dates: %{}, languages: %{}, machines: %{}, new_xp: 0, total_xp: 0

  @doc """
  Parses the user's data from the Code::Stats API.
  """
  @spec parse(map()) :: t()
  def parse(input) do
    %__MODULE__{
      user: input["user"],
      dates: CodestatsAPI.Stats.Dates.parse(input["dates"]),
      languages: CodestatsAPI.Stats.Languages.parse(input["languages"]),
      machines: CodestatsAPI.Stats.Machines.parse(input["machines"]),
      new_xp: CodestatsAPI.Stats.Xp.parse(input["new_xp"]),
      total_xp: CodestatsAPI.Stats.Xp.parse(input["total_xp"])
    }
  end
end
