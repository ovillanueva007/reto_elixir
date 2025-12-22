defmodule RetoElixir.Infrastructure.EntryPoint.RouterController do
  require Logger
  use Plug.Router
  use Timex

  @path_signup "/api/signup"

  plug(CORSPlug,
    methods: ["GET", "POST", "PUT", "DELETE"],
    origin: [~r/.*/],
    headers: ["Content-Type", "Accept", "User-Agent"]
  )

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded, :json], json_decoder: Poison)
  plug(Plug.Telemetry, event_prefix: [:internal_information_ms, :plug])
  plug(:dispatch)

  forward(@path_signup,
    to: RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandler
  )
end
