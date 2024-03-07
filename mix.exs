defmodule CodestatsAPI.MixProject do
  use Mix.Project

  def project do
    [
      app: :codestats_api,
      deps: deps(),
      description: "Code::Stats API client",
      docs: docs(),
      elixir: "~> 1.10",
      elixirc_options: [
        warnings_as_errors: true
      ],
      package: package(),
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/general-CbIC/codestats_api",
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      version: "0.2.0"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ssl, :inets]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.0"},
      # dev environment
      {:credo, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, ">= 0.0.0", only: :dev, runtime: false},
      {:doctor, ">= 0.0.0", only: :dev, runtime: false},
      {:ex_check, "~> 0.16.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      # test environment
      {:exvcr, "~> 0.14", only: :test}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "CONTRIBUTING.md"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://github.com/general-CbIC/codestats_api/blob/develop/CHANGELOG.md",
        "GitHub" => "https://github.com/general-CbIC/codestats_api",
        "Sponsor" => "https://github.com/sponsors/general-CbIC"
      }
    ]
  end
end
