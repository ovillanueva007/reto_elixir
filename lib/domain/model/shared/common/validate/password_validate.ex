defmodule RetoElixir.Model.Shared.Common.Validate.PasswordValidate do
  def validate(nil), do: {:error, :weak_password}

  def validate(password) when not is_binary(password), do: {:error, :weak_password}

  def validate(password) do
    case String.length(password) >= 8 do
      true -> {:ok, true}
      false -> {:error, :weak_password}
    end
  end
end
