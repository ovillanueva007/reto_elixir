defmodule RetoElixir.Model.Shared.Common.Validate.EmailValidate do

  def validate(nil), do: {:error, :invalid_email_format}

  def validate(email) when not is_binary(email), do: {:error, :invalid_email_format}

  def validate(email) do
    email_pattern = ~r/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

    case Regex.match?(email_pattern, email) do
      true -> {:ok, true}
      false -> {:error, :invalid_email_format}
    end
  end
end
