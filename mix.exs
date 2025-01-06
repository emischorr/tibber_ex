defmodule TibberEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :tibber_ex,
      version: "0.1.0",
      name: "TibberEx",
      description: "An opinionated wrapper for the Tibber API",
      source_url: "https://github.com/emischorr/tibber_ex",
      homepage_url: "https://github.com/emischorr/tibber_ex",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: [
        # The main page in the docs
        main: "TibberEx",
        # logo: "path/to/logo.png",
        extras: ["README.md"]
      ]
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
      {:tesla, "~> 1.13"},
      {:jason, ">= 1.4.0"},
      {:mint, "~> 1.6"},
      {:castore, "~> 1.0"},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      name: "tibber_ex",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/emischorr/tibber_ex"}
    ]
  end
end
