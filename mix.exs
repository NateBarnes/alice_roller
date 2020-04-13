defmodule AliceRoller.MixProject do
  use Mix.Project

  def project do
    [
      app: :alice_roller,
      version: "0.3.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test],
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
      {:alice, "~> 0.4.3", override: true},
      {:high_roller, "~> 0.4.1"},
      {:excoveralls, "~> 0.12.3", only: :test}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/NateBarnes/alice_roller",
        "Docs" => "https://hexdocs.pm/alice_roller/0.3.0"
      }
    ]
  end
end
