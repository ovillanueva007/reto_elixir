defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.ValidationBody do
  @moduledoc """
  Module to validate the body for Get Relationship Record
  """

  def validate_body(body) do
    with {:ok, true} <- validate_map(body) do
      {:ok, true}
    else
      error -> error
    end
  end

  defp validate_map(body) do
    case Enum.count(Map.to_list(body)) do
      0 -> {:error, :get_relation_empty_body}
      _ -> {:ok, true}
    end
  end

end
