import Config

config :reto_elixir,
  timezone: "America/Bogota",
  env: :dev,
  http_port: 8083,
  enable_server: true,
  version: "0.0.1",
  custom_metrics_prefix_name: "reto_elixir_local"

config :logger,
  level: :debug

config :reto_elixir,
  signup_gateway_write: RetoElixir.DrivenAdapters.Repository.SignUpWriteGateway,
  signin_gateway_read: RetoElixir.DrivenAdapters.Repository.SignInReadGateway,
  session_gateway_write: RetoElixir.DrivenAdapters.Repository.SessionWriteGateway
