# Alpaca Mix Project Example

Just run mix deps.get, iex -S mix run, and then in the shell you can call 
Alpaca functions:

```elixir
# Simple function that adds two integers
:alpaca_example.add(2, 2)

# This function calls back into Elixir to print a message
:alpaca_example.round_trip({})
```

