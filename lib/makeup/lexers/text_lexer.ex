defmodule Makeup.Lexers.TextLexer do
  @moduledoc """
  Lexer for text to be used with the Makeup package.
  """

  @behaviour Makeup.Lexer

  import NimbleParsec
  import Makeup.Lexer.Combinators

  whitespace =
    [?\r, ?\s, ?\n, ?\f]
    |> ascii_string(min: 1)
    |> token(:whitespace)

  line = utf8_string([{:not, ?\n}, {:not, ?\r}], min: 1)

  text = token(line, :text)

  root_element_combinator = choice([whitespace, text])

  @doc false
  def __as_text_language__({type, meta, value}) do
    {type, Map.put(meta, :language, :text), value}
  end

  @impl Makeup.Lexer
  defparsec(
    :root_element,
    root_element_combinator |> map({__MODULE__, :__as_text_language__, []})
  )

  @impl Makeup.Lexer
  defparsec(:root, repeat(parsec(:root_element)))

  @impl Makeup.Lexer
  def postprocess(tokens, _opts \\ []), do: tokens

  @impl Makeup.Lexer
  def match_groups(tokens, _opts \\ []), do: tokens

  @impl Makeup.Lexer
  def lex(text, _opts \\ []) do
    {:ok, tokens, "", _, _, _} = root(text)

    tokens
    |> postprocess()
    |> match_groups()
  end
end
