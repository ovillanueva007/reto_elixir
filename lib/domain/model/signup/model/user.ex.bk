defmodule RetoElixir.Domain.Model.Signup.Model.User do
  defstruct [:email, :password, :name]

  @email_regex ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/

  def validate(params) do
    with :ok <- validate_required(params),
         :ok <- validate_email(params["email"]),
         :ok <- validate_password(params["password"]) do
      {:ok, %__MODULE__{
        email: params["email"],
        password: params["password"],
        name: params["name"]
      }}
    end
  end

  defp validate_required(%{"email" => _, "password" => _, "name" => _}), do: :ok
  defp validate_required(_), do: {:error, :malformed_request}

  defp validate_email(email) do
    if Regex.match?(@email_regex, email), do: :ok, else: {:error, :invalid_email_format}
  end

  defp validate_password(pass) when is_binary(pass) do
    if String.length(pass) >= 8, do: :ok, else: {:error, :weak_password}
  end
  defp validate_password(_), do: {:error, :weak_password}
end
