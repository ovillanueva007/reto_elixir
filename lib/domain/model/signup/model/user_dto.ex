defmodule RetoElixir.Model.SignUp.UserDto do
  defstruct [:email, :password, :name]

  @type t :: %__MODULE__{
          email: String.t(),
          password: String.t(),
          name: String.t()
        }

  def new(email, password, name) do
    {:ok,
     %__MODULE__{
       email: email,
       password: password,
       name: name
     }}
  end
end
