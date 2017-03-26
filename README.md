# Alpaca Mix Compiler

A mix compiler you can add to your project in order to compile Alpaca
source files.

## Installation

Add the following to your Mix dependencies:

```elixir
{:alpaca_lib, git: "https://github.com/lepoetemaudit/alpaca_mix_compiler", branch: "master"}
```

Ensure it is added as a compiler in your project definition:

```elixir
compilers: Mix.compilers ++ [:alpaca],
```