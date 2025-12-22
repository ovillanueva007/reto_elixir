defmodule RetoElixir.UseCase.SignUp.SignUpUseCase do
  require Logger
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Model.SignUp.UserDto
  alias RetoElixir.Domain.Model.ContextData

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
    Logger.info("Inside SignUpUseCase...")

    case @signup_gateway_write.create_user(command) do
      {:ok, response} -> {:ok, response}
      error -> error
    end
  end
end
