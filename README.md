# TibberEx

An opinionated wrapper for the Tibber GraphQL API.
Currently only priceInfo and priceRating are implemented.

## Example

```elixir
token = System.get_env("TIBBER_TOKEN")
client = TibberEx.Client.new(token)

TibberEx.Api.price_rating(client)
# %{
#   currency: "EUR",
#   entries: %{
#     ~U[2025-01-03 05:00:00.000Z] => %{
#       total: 0.3084,
#       level: "HIGH",
#       difference: 25.283416820458783
#     },
#     ...
#   },
#   maxTotal: 0.3909,
#   minTotal: 0.1892
}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tibber_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tibber_ex, "~> 0.1.0"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/tibber_ex>.
