# MakeupText

A [Makeup](https://github.com/elixir-makeup/makeup/) lexer for plain text.

This is a null lexer which means every token is a `:text` no matter the content.

## Installation

Add `makeup_text` to your list of dependencies in mix.exs:

```elixir
def deps do
  [
    {:makeup_text, github: "BeaconCMS/makeup_text"}
  ]
end
```

The lexer will automatically register itself with Makeup for `text` as well as `.txt` extension.

## Acknowledgements

Based on [makeup_diff](https://github.com/elixir-makeup/makeup_diff).
