# TibberEx

An opinionated wrapper for the Tibber GraphQL API.
Currently only priceInfo is implemented.

## Example

```elixir
"TIBBER_TOKEN"
|> System.get_env()
|> TibberEx.price_info()
# %{
#   ~U[2025-10-09 04:30:00.000Z] => %{total: 0.3664, energy: 0.1324, tax: 0.234},
#   ~U[2025-10-08 12:30:00.000Z] => %{total: 0.316, energy: 0.09, tax: 0.226},
#   ~U[2025-10-08 16:15:00.000Z] => %{total: 0.3846, energy: 0.1476, tax: 0.237},
#   ~U[2025-10-08 03:00:00.000Z] => %{total: 0.3124, energy: 0.087, tax: 0.2254},
#   ...
# }
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
