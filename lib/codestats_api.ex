defmodule CodestatsAPI do
  @moduledoc """
  This module is responsible for handling the requests to the Code::Stats API.
  """

  @doc """
  Returns the user's data from the Code::Stats API.

  ## Examples

      iex> {:ok, %CodestatsAPI.Stats{} = result} = CodestatsAPI.get_user_data("cbic")
      iex> result.user
      "cbic"
  """
  @spec get_user_data(String.t()) ::
          {:ok, CodestatsAPI.Stats.t()}
          | {:error, :user_not_found}
          | {:error, :something_went_wrong}
  def get_user_data(username) do
    url = "https://codestats.net/api/users/#{username}"

    :ssl.start()
    :application.start(:inets)

    case :httpc.request(:get, {url, []}, [], []) do
      {:ok, {{_version, 200, _reason_phrase}, _headers, body}} ->
        {:ok, body |> Jason.decode!() |> CodestatsAPI.Stats.parse()}

      {:ok, {{_version, 404, _reason_phrase}, _headers, _body}} ->
        {:error, :user_not_found}

      _ ->
        {:error, :something_went_wrong}
    end
  end
end
