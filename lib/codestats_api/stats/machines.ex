defmodule CodestatsApi.Stats.Machines do
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
end
