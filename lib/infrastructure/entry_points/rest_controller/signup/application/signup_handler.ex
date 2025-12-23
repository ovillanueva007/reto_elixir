defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandler do
  use Plug.Router
  require Logger

  alias RetoElixir.Utils.DataTypeUtils

  alias RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpBuild

  alias RetoElixir.UseCase.SignUp.SignUpUseCase

  alias RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpBuildRes
  alias RetoElixir.Shared.ResponseController
  alias RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandleError
  alias RetoElixir.Infrastructure.EntryPoint.SignUp.ResponseSuccessBody

  plug(:match)
  plug(:dispatch)

  @path "/"

  post @path do
    Logger.info("Inside SignUpHandler...")

    headers =
      conn.req_headers
      |> DataTypeUtils.normalize_headers()

    message_id = Map.get(headers, :MESSAGE_ID, "")
    body = conn.body_params |> DataTypeUtils.normalize()

    #validar header
    #validar body
    with {:ok, dto_command} <- SignUpBuild.build_dto_command(body, headers) do
      #{:ok, result} <- SignUpUseCase.execute(dto_command) do
         #{:ok, response} <- SignUpBuildRes.build(result) do
      #ResponseSuccessBody.build_response(
      #  response,
      #  message_id
      #)
      #|>
      #
      SignUpUseCase.execute(dto_command)
      |> ResponseController.build_response(conn)
    else
      exception ->
        SignUpHandleError.handle_error(exception, conn, message_id)
    end
    #Logger.info("Leaving SignUpHandler...")
  end
end
