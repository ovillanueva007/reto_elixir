defmodule RetoElixir.Infrastructure.EntryPoint.SignIn.ValidationBody do
  def validate_body(body) do
    with {:ok, true} <- validate_map(body),
         {:ok, true} <- validate_field_email(body),
         {:ok, true} <- validate_field_password(body) do
      {:ok, true}
    else
      error -> error
    end
  end

  defp validate_map(body) do
    case Enum.count(Map.to_list(body)) do
      0 -> {:error, :bad_request}
      _ -> {:ok, true}
    end
  end

  defp validate_field_email(body) do
    case Map.has_key?(body, :email) do
      false -> {:error, :bad_request}
      true -> {:ok, true}
    end
  end

  defp validate_field_password(body) do
    case Map.has_key?(body, :password) do
      false -> {:error, :bad_request}
      true -> {:ok, true}
    end
  end
end
