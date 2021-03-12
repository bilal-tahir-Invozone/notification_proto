defmodule NotificationProto.MixProject do
  use Mix.Project

  def project do
    [
      app: :notification_proto,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.

  def application, do: [applications: [:grpc]]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, github: "elixir-grpc/grpc"},
      {:cowlib, "~> 2.9.0", override: true},
      {:google_protos, "~> 0.1"}

    ]
  end
end
