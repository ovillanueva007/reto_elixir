defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandler do
  use Plug.Router
  require Logger

  alias RetoElixir.Utils.DataTypeUtils

  alias RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpBuild

  alias RetoElixir.UseCase.SignUp.SignUpUseCase

  alias RetoElixir.Shared.ResponseController
  alias RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandleError
  alias RetoElixir.Infrastructure.EntryPoint.SignUp.ValidationHeaders
  alias RetoElixir.Infrastructure.EntryPoint.SignUp.ValidationBody

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
         {:ok, dto_command} <- SignUpBuild.build_dto_command(body, headers),
         {:ok, true} <- SignUpUseCase.execute(dto_command) do
      ResponseController.build_response(%{}, conn)
    else
      exception ->
        SignUpHandleError.handle_error(exception, conn, message_id)
    end
  end
end
