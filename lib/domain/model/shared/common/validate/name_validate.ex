defmodule RetoElixir.Model.Shared.Common.Validate.NameValidate do
  def validate(nil), do: {:error, :invalid_name}

  def validate(name) when not is_binary(name), do: {:error, :invalid_name}

  def validate(name) do
    case String.length(name) >= 3 do
      true -> {:ok, true}
      false -> {:error, :invalid_name}
    end
  end
end
