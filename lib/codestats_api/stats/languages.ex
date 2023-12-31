defmodule CodestatsAPI.Stats.Languages do
  @moduledoc """
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
            new_xps: CodestatsAPI.Stats.Xp.t(),
            xps: CodestatsAPI.Stats.Xp.t()
          }
        }

  @doc """
  Parses the languages from the user's data from the Code::Stats API.
  """
  @spec parse(map()) :: t()
  def parse(input) do
    input
    |> Enum.map(fn {language, %{"new_xps" => new_xps, "xps" => xps}} ->
      {
        language,
        %{
          new_xps: CodestatsAPI.Stats.Xp.parse(new_xps),
          xps: CodestatsAPI.Stats.Xp.parse(xps)
        }
      }
    end)
    |> Enum.into(%{})
  end
end
