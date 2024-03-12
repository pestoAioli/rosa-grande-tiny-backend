defmodule RosaGrande.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RosaGrandeWeb.Telemetry,
      RosaGrande.Repo,
      {DNSCluster, query: Application.get_env(:rosa_grande, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RosaGrande.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RosaGrande.Finch},
      # Start a worker by calling: RosaGrande.Worker.start_link(arg)
      # {RosaGrande.Worker, arg},
      # Start to serve requests, typically the last entry
      RosaGrandeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RosaGrande.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RosaGrandeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
