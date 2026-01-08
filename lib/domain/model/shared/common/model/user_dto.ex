defmodule RetoElixir.Model.Shared.Common.UserDto do
  alias RetoElixir.Model.Shared.Common.Email
  alias RetoElixir.Model.Shared.Common.Password
  alias RetoElixir.Model.Shared.Common.Name

  defstruct [:email, :password, :name]

  @type t :: %__MODULE__{
          email: Email.t(),
          password: Password.t(),
          name: Name.t()
        }

  def new(email, password, name) do
    with {:ok, new_email} <- Email.new(email),
         {:ok, new_password} <- Password.new(password),
         {:ok, new_name} <- Name.new(name) do
      {:ok,
       %__MODULE__{
         email: new_email,
         password: new_password,
         name: new_name
       }}
    else
      error ->
        error
    end
  end

  def new(email, password) do
    with {:ok, new_email} <- Email.new(email),
         {:ok, new_password} <- Password.new(password) do
      {:ok,
       %__MODULE__{
         email: new_email,
         password: new_password
       }}
    else
      error ->
        error
    end
  end

  def new_signin(email, password) do
    with {:ok, new_email} <- Email.new_signin(email),
         {:ok, new_password} <- Password.new_signin(password) do
      {:ok,
       %__MODULE__{
         email: new_email,
         password: new_password
       }}
    else
      error ->
        error
    end
  end
end
