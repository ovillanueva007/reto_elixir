defmodule RetoElixir.UseCase.SignUp.SignUpUseCase do
  require Logger
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Domain.Model.ContextData
  alias RetoElixir.Model.Shared.Common.UserDto

  @signup_gateway_write Application.compile_env(
                          :reto_elixir,
                          :signup_gateway_write
                        )

  def execute(
        %Command{
          payload: %UserDto{},
          context: %ContextData{}
        } = command
      ) do
    with {:ok, _user} <- @signup_gateway_write.create_user(command) |> IO.inspect() do
      {:ok, true}
    else
      error -> error
    end
  end
end
