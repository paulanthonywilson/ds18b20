defmodule Ds18b20.MixProject do
  use Mix.Project

  def project do
    [
      app: :ds18b20,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix]],
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Ds18b20.Application, []}
    ]
  end

  defp deps do
    [
      # dev
      {:credo, "~> 1.6", only: [:dev, :test]},
      {:dialyxir, "~> 1.2", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.29.1", only: :dev, runtime: false},

      # actual deps
      {:decimal, "~> 2.0"},
      {:simplest_pub_sub, "~> 0.1.0"}
    ]
  end

  defp docs do
    [main: "readme", extras: ["README.md"]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
