defmodule Alterpy2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Alterpy2.Worker.start_link(arg)
      # {Alterpy2.Worker, arg}
      ExGram,
      {Alterpy2.Bot, [method: :polling, token: Application.get_env(:ex_gram, :token)]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Alterpy2.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
