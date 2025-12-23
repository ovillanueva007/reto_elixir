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
    Logger.info("Inside SignUpUseCase.execute...")

    with {:ok, result} <- @signup_gateway_write.create_user(command) do
      {:ok, result}
    else
      error -> error
    end

    Logger.info("Leaving SignUpUseCase.execute...")

    # with {:ok, result} <-
    #       @signup_gateway_write.create_user(command) do
    #  Logger.info("Inside SignUpUseCase124124124...")
    #  {:ok, result}
    # else
    #  error ->
    #    error
    #    Logger.info("Inside Errorrrrr")
    # end
  end
end
