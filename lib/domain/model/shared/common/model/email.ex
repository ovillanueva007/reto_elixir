defmodule RetoElixir.Model.Shared.Common.Email do
  alias RetoElixir.Model.Shared.Common.Validate.EmailValidate

  defstruct [:email]

  @type t :: %__MODULE__{
          email: String.t()
        }

  def new(email) do
    case EmailValidate.validate(email) do
      {:ok, true} ->
        {:ok,
         %__MODULE__{
           email: email
         }}

      error ->
        error
    end
  end

  def new_signin(email) do
    {:ok,
     %__MODULE__{
       email: email
     }}
  end
end
