defmodule TwilioMagicValues.MixProject do
  use Mix.Project

  def project do
    [
      app: :twilio_magic_values,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Twilio Magic Values",
      source_url: "https://github.com/scottswezey/twilio_magic_values",
      homepage_url: "https://scottswezey.github.io/twilio_magic_values",
      docs: [main: "Readme", extras: ["README.md": [title: "Readme"]], output: "docs"]
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
      {:poison, "~> 3.1", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
