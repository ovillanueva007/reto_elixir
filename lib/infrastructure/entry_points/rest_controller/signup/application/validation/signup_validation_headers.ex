defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.ValidationHeaders do
  def validate_headers(%{} = headers) when map_size(headers) == 0 do
    {:error, :signup_headers_empty}
  end

  def validate_headers(headers) do
    message_id = Map.get(headers, :MESSAGE_ID, "")
    x_request_id = Map.get(headers, :X_REQUEST_ID, "")

    with {:ok, true} <- validate_exist_header(message_id),
         {:ok, true} <- validate_exist_header(x_request_id) do
      {:ok, true}
    else
      error -> error
    end
  end

  defp validate_exist_header(header) when is_binary(header) do
    if String.length(header) > 0 do
      {:ok, true}
    else
      {:error, :missing_headers_signup}
    end
  end
end
