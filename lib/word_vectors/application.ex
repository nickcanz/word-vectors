defmodule WordVectors.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WordVectorsWeb.Telemetry,
      # Start the Ecto repository
      WordVectors.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: WordVectors.PubSub},
      # Start Finch
      {Finch, name: WordVectors.Finch},
      # Start the Endpoint (http/https)
      WordVectorsWeb.Endpoint
      # Start a worker by calling: WordVectors.Worker.start_link(arg)
      # {WordVectors.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WordVectors.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WordVectorsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
