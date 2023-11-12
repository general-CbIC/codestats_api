defmodule CodestatsApiTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Httpc

  doctest CodestatsApi

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  describe "get_user_data/1" do
    test "returns the data from the Code::Stats API for user `cbic`" do
      use_cassette "get_user_data_cbic" do
        assert {:ok, %CodestatsApi.Stats{} = result} = CodestatsApi.get_user_data("cbic")

        # user name
        assert result.user == "cbic"

        # dates
        assert is_map(result.dates)
        assert result.dates["2021-03-05"] == 22626
        assert result.dates["2021-03-26"] == 69
        assert result.dates["2021-01-13"] == 467
        assert Enum.count(result.dates) == 822

        # languages
        assert is_map(result.languages)
        assert result.languages["GraphQL"] == %{new_xps: 0, xps: 62}
        assert result.languages["SQL"] == %{new_xps: 0, xps: 734}
        assert Enum.count(result.languages) == 43

        # machines
        assert result.machines == %{
                 "MacBook Pro (15-inch, 2019)" => %{
                   new_xps: 522,
                   xps: 1_010_291
                 }
               }

        # new_xp
        assert result.new_xp == 522

        # total_xp
        assert result.total_xp == 1_010_291
      end
    end

    test "returns the data from the Code::Stats API for user `test`" do
      use_cassette "get_user_data_test" do
        assert {:ok, %CodestatsApi.Stats{} = result} = CodestatsApi.get_user_data("test")

        # user name
        assert result.user == "test"

        # dates
        assert result.dates == %{}

        # languages
        assert result.languages == %{}

        # machines
        assert result.machines == %{}

        # new_xp
        assert result.new_xp == 0

        # total_xp
        assert result.total_xp == 0
      end
    end
  end
end
