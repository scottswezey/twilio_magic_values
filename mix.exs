defmodule TwilioMagicValues.MixProject do
  use Mix.Project

  def project do
    [
      app: :twilio_magic_values,
      version: "1.0.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Code coverage
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Docs / Hex
      name: "Twilio Magic Values",
      description:
        "Provide elixir apps with simple, pragmatic access to magic testing values for the Twilio API.",
      package: package(),
      source_url: "https://github.com/scottswezey/twilio_magic_values",
      # homepage_url: "https://github.com/scottswezey/twilio_magic_values",
      docs: [
        main: "readme",
        extras: ["README.md": [title: "Readme"], "CONTRIBUTING.md": [title: "Contributing"]]
        # output: "docs"
      ]
    ]
  end

  defp package() do
    [
      name: "twilio_magic_values",
      files: ["lib", "mix.exs", "*.md", "LICENSE", ".formatter.exs"],
      maintainers: ["Scott Swezey"],
      licenses: ["GPL-3.0"],
      links: %{
        "GitHub" => "https://github.com/scottswezey/twilio_magic_values"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:httpoison, "~> 1.0", only: :test},
      {:poison, "~> 4.0.0", only: [:dev, :test]},
      {:credo, "~> 0.10.2", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.8", only: :test}
    ]
  end
end
