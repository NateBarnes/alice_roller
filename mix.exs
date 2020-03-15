defmodule AliceRoller.MixProject do
  use Mix.Project

  def project do
    [
      app: :alice_roller,
      version: "0.2.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "An addon for Alice that allows users to roll dice in chat"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:alice, "~> 0.3.7"},
      {:high_roller, "~> 0.3.2"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/NateBarnes/alice_roller",
        "Docs" => "https://hexdocs.pm/alice_roller/0.2.0"
      }
    ]
  end
end
