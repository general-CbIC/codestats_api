defmodule CodestatsAPI.Stats.Machines do
  @moduledoc """
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
            new_xps: CodestatsAPI.Stats.Xp.t(),
            xps: CodestatsAPI.Stats.Xp.t()
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
          new_xps: CodestatsAPI.Stats.Xp.parse(new_xps),
          xps: CodestatsAPI.Stats.Xp.parse(xps)
        }
      }
    end)
    |> Enum.into(%{})
  end
end
