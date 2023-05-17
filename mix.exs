defmodule MakeupText.MixProject do
  use Mix.Project

  def project do
    [
      app: :makeup_text,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  defp description do
    """
    Text lexer for the Makeup syntax highlighter.
    """
  end

  defp package do
    [
      name: :makeup_text,
      licenses: ["MIT"],
      maintainers: ["Leandro Pereira <leandro@leandro.io>"],
      links: %{"GitHub" => "https://github.com/BeaconCMS/makeup_text"}
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Makeup.Lexers.TextLexer.Application, []}
    ]
  end

  defp deps do
    [
      {:makeup, "~> 1.0"},
      {:stream_data, "~> 0.5", only: [:dev, :test]},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end
end
