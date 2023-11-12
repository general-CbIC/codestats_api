defmodule CodestatsApi.Stats.Machines do
  @moduledoc false

  @typedoc """
  Map of machine names to XP.

  Example:
    %{
      "MacBook Pro (20-inch, 2030)": %{
        new_xps: 100,
        xps: 464413
      },
      "Lenovo yoba": %{
        new_xps: 0,
        xps: 500
      }
    }

  """
  @type t() :: %{
          String.t() => %{
            new_xps: CodestatsApi.Stats.Xp.t(),
            xps: CodestatsApi.Stats.Xp.t()
          }
        }

  @doc """
  Parses the machines from the user's data from the Code::Stats API.
  """
  @spec parse(map()) :: t()
  def parse(input) do
    input
    |> Enum.map(fn {machine, %{"new_xps" => new_xps, "xps" => xps}} ->
      {
        machine,
        %{
          new_xps: CodestatsApi.Stats.Xp.parse(new_xps),
          xps: CodestatsApi.Stats.Xp.parse(xps)
        }
      }
    end)
    |> Enum.into(%{})
  end
end
