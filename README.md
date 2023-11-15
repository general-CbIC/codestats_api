# CodestatsApi

Elixir library for making requests to [Code::Stats](https://codestats.net/). Why not?

The library uses only one external dependency - [Jason](https://hex.pm/packages/jason), to parse the JSON result. For HTTP requests, the built-in OTP [:httpc](https://www.erlang.org/doc/man/httpc.html) is used.

## Requirements

TODO: add

## Installation

Add `:codestats_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:codestats_api, "~> 0.1.0"}
  ]
end
```

## Usage

### Get user's Stats

```elixir
{:ok, %CodestatsApi.Stats{}} = CodestatsApi.get_user_data("username")
```

That's all :)
A detailed description of the `Stats` structure can be found [here](https://hexdocs.pm/codestats_api/CodestatsApi.Stats.html).

## Contributions

If you feel something can be improved or have any questions about specific behaviors or pieces of implementation, please feel free to file an issue. Proposed changes should be taken to issues before any PRs to save time on code that might not be merged upstream.

If you are ready to change the project, please read the [Contributing guide](CONTRIBUTING.md) first.

## 1.0.0 Roadmap

- [x] Interface to get user's stats
- [ ] Interface to push updates
