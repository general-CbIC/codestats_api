# CodestatsAPI

![Build and tests workflow](https://github.com/general-CbIC/codestats_api/actions/workflows/ci-tests.yml/badge.svg)
[![hex.pm version](https://img.shields.io/hexpm/v/codestats_api.svg?style=flat)](https://hex.pm/packages/codestats_api)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg?style=flat)](https://hexdocs.pm/codestats_api/)
[![License](https://img.shields.io/hexpm/l/codestats_api.svg?style=flat)](https://github.com/general-CbIC/codestats_api/blob/main/LICENSE)
[![Total Download](https://img.shields.io/hexpm/dt/codestats_api.svg?style=flat)](https://hex.pm/packages/codestats_api)

Elixir library for making requests to [Code::Stats](https://codestats.net/). Why not?

The library uses only one external dependency - [Jason](https://hex.pm/packages/jason), to parse the JSON result. For HTTP requests, the built-in OTP [:httpc](https://www.erlang.org/doc/man/httpc.html) is used.

## Requirements

| Requirement | Version |
|-------------|---------|
| Erlang/OTP  | >= 23   |
| Elixir      | >= 1.10 |

## Installation

Add `:codestats_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:codestats_api, "~> 0.2.0"}
  ]
end
```

## Usage

### Get user's Stats

```elixir
{:ok, %CodestatsAPI.Stats{}} = CodestatsAPI.get_user_data("username")
```

That's all :)
A detailed description of the `Stats` structure can be found [here](https://hexdocs.pm/codestats_api/CodestatsAPI.Stats.html).

## Contributions

If you feel something can be improved or have any questions about specific behaviors or pieces of implementation, please feel free to file an issue. Proposed changes should be taken to issues before any PRs to save time on code that might not be merged upstream.

If you are ready to change the project, please read the [Contributing guide](CONTRIBUTING.md) first.

## 1.0.0 Roadmap

- [x] Interface to get user's stats
- [ ] Interface to push updates
