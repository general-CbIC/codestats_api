defmodule CodestatsApi.Stats.Xp do
  @typedoc """
  Integer representing the amount of XP.
  """
  @type t() :: non_neg_integer()

  @doc """
  Parses the XP from the user's data from the Code::Stats API.
  """
  @spec parse(integer() | String.t()) :: t()
  def parse(input) when is_integer(input) do
    input
  end

  def parse(input) do
    String.to_integer(input)
  end
end
