defmodule RetoElixir.Model.Shared.Common.Password do
  alias RetoElixir.Model.Shared.Common.Validate.PasswordValidate

  defstruct [:password]

  @type t :: %__MODULE__{
          password: String.t()
        }

  def new(password) do
    case PasswordValidate.validate(password) do
      {:ok, true} ->
        {:ok,
         %__MODULE__{
           password: password
         }}

      error ->
        error
    end
  end

  def new_signin(password) do
    {:ok,
     %__MODULE__{
       password: password
     }}
  end
end
