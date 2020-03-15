defmodule AliceRoller.MixProject do
  use Mix.Project

  def project do
    [
      app: :alice_roller,
      version: "0.2.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:alice, "~> 0.3.7"},
      {:high_roller, "~> 0.3.2"}
    ]
  end
end
