defmodule RetoElixir.Infrastructure.EntryPoint.SignIn.SignInHandler do
  use Plug.Router
  require Logger

  alias RetoElixir.Utils.DataTypeUtils

  alias RetoElixir.UseCase.SignIn.SignInUseCase

  alias RetoElixir.Shared.ResponseController

  alias RetoElixir.Infrastructure.EntryPoint.SignIn.ValidationHeaders
  alias RetoElixir.Infrastructure.EntryPoint.SignIn.ValidationBody
  alias RetoElixir.Infrastructure.EntryPoint.SignIn.SignInBuild
  alias RetoElixir.Infrastructure.EntryPoint.SignIn.SignInBuildResponse
  alias RetoElixir.Infrastructure.EntryPoint.SignIn.ResponseSuccessBody
  alias RetoElixir.Infrastructure.EntryPoint.SignIn.SignInHandleError

  plug(:match)
  plug(:dispatch)

  @path "/"

  post @path do
    headers =
      conn.req_headers
      |> DataTypeUtils.normalize_headers()

    message_id = Map.get(headers, :MESSAGE_ID, "")
    body = conn.body_params |> DataTypeUtils.normalize()

    with {:ok, true} <- ValidationHeaders.validate_headers(headers),
         {:ok, true} <- ValidationBody.validate_body(body),
         {:ok, dto_query} <- SignInBuild.build_dto_query(body, headers),
         {:ok, session} <- SignInUseCase.execute(dto_query) |> IO.inspect(),
         {:ok, response} <- SignInBuildResponse.build(session) do
      ResponseSuccessBody.build_response(response, message_id)
      |> ResponseController.build_response(conn)
    else
      exception ->
        SignInHandleError.handle_error(exception, conn, message_id)
    end
  end
end
