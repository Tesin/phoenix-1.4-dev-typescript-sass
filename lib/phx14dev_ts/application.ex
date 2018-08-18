defmodule Phx14devTs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Phx14devTs.Repo,
      # Start the endpoint when the application starts
      Phx14devTsWeb.Endpoint,
      # Starts a worker by calling: Phx14devTs.Worker.start_link(arg)
      # {Phx14devTs.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phx14devTs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Phx14devTsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
