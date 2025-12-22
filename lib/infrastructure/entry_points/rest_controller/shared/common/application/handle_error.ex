defmodule RetoElixir.Infrastructure.EntryPoint.HandleError do
  @moduledoc """
  MsInternalInformation health check
  """
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
    %{
      "meta" => %{
        "messageId" => message_id,
        "requestDate" => get_request_date(),
        "responseSize" => 1,
        "clientRequest" => ""
      },
      "data" => nil,
      "message" => nil,
      "errors" => [
        %{
          "id" => UUID.uuid1(),
          "status" => exception_result.status,
          "code" => exception_result.code,
          "title" => "Operación fallida",
          "detail" => exception_result.detail
        }
      ]
    }
  end

  defp build_error_response(response, conn),
    do: ResponseController.build_response(%{status: List.first(response["errors"])["status"], body: response}, conn)

  defp get_request_date() do
    now = DateTime.utc_now() |> Timex.to_datetime("America/Bogota")

    "#{now.day}/#{now.month}/#{now.year} #{now.hour}:#{now.minute}:#{now.second}:#{elem(now.microsecond, 0)}"
  end
end
