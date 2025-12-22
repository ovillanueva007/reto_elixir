defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpHandleError do

  alias RetoElixir.EntryPoints.Shared.EcsModelResponse
  require Logger
  alias RetoElixir.Infrastructure.EntryPoint.PrintEcsLog
  alias RetoElixir.Shared.ResponseController
  alias RetoElixir.Domain.Model.Exception

  def handle_error(exception, conn, message_id) do
    exception
    |> make_error(message_id, conn)
    |> build_error_response(conn)
  end

  defp make_error(exception, message_id, conn) do
    exception_result = Exception.build_exception(exception)

    exception_result
    |> EcsModelResponse.build_structure(message_id, conn)
    |> PrintEcsLog.print_ecs_log()

    {
      exception_result.status,
      %{
        "meta" => %{
          "_messageId" => message_id,
          "_requestDateTime" => get_request_date()
        },
        "errors" => [
          %{
            "code" => exception_result.code,
            "detail" => exception_result.detail
          }
        ]
      }
    }
  end

  defp build_error_response({status, response}, conn),
    do: ResponseController.build_response(%{status: status, body: response}, conn)

  defp get_request_date() do
    now =
      DateTime.utc_now()
      |> Timex.to_datetime("America/Bogota")
      |> Timex.format!("{ISO:Extended}")

    String.replace(now, ~r/(\.\d{3})\d+/, "\\1")
  end
end
