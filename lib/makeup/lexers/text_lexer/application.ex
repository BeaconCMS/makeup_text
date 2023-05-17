defmodule Makeup.Lexers.TextLexer.Application do
  @moduledoc false

  use Application

  alias Makeup.Registry
  alias Makeup.Lexers.TextLexer

  # https://pygments.org/docs/lexers/#pygments.lexers.special.TextLexer
  def start(_type, _args) do
    Registry.register_lexer(TextLexer, options: [], names: ["text"], extensions: ["txt"])
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
