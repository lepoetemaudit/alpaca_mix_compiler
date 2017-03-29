# Alpaca Mix Compiler

A mix compiler you can add to your project in order to compile Alpaca
source files.

## Installation

Add the following to your Mix dependencies:

```elixir
{:alpaca_compiler, git: "https://github.com/lepoetemaudit/alpaca_mix_compiler", branch: "master"}
```

Ensure it is added as a compiler in your project definition:

```elixir
compilers: Mix.compilers ++ [:alpaca],
```

## Issues

You may need to add an explicit reference to epo_runtime in your Mix.lock file;
the API for this is changing and doesn't return expect results, so error
messages may not show up correctly unless you do this.

```elixir
"epo_runtime": {:git, "git://github.com/brigadier/epo_runtime.git", "a3e50e7cebb526f833757e867bbe914c1da7baa3", [tag: "0.3"]}
```
