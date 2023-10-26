defmodule CodestatsApi.Stats.Languages do
  @typedoc """
  Map of programming lanuage names to XP.

  Example:
    %{
      "Elixir": %{
        new_xps: 100,
        xps: 464413
      },
      "Rust": %{
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
