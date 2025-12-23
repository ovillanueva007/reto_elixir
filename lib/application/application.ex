defmodule RetoElixir.Application do
  @moduledoc """
  RetoElixir application
  """

  #alias RetoElixir.Infrastructure.EntryPoint.RestController.SignUp.Infra.RouterSignUp
  alias RetoElixir.Infrastructure.EntryPoint.RouterController
  alias RetoElixir.Config.{AppConfig, ConfigHolder}

  use Application
  require Logger

  def start(_type, [env]) do
    config = AppConfig.load_config()

    children = with_plug_server(config) ++ all_env_children(config) ++ env_children(env, config)

    opts = [strategy: :one_for_one, name: RetoElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp with_plug_server(%AppConfig{enable_server: true, http_port: port}) do
    Logger.debug("Configure Http server in port #{inspect(port)}. ")
    [
      RetoElixir.DrivenAdapters.Repository.SignUpWriteGateway,
      {Plug.Cowboy, scheme: :http, plug: RouterController, options: [port: port]}
    ]
  end

  defp with_plug_server(%AppConfig{enable_server: false}), do: []

  def all_env_children(%AppConfig{} = config) do
    [
      {ConfigHolder, config}
    ]
  end

  def env_children(:test, %AppConfig{}) do
    []
  end

  def env_children(_other_env, _config) do
    []
  end
end
