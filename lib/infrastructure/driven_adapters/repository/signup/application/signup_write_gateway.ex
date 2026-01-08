defmodule RetoElixir.DrivenAdapters.Repository.SignUpWriteGateway do
  require Logger
  use Agent
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Domain.Model.ContextData
  alias RetoElixir.Model.Shared.Common.UserDto
  alias RetoElixir.DrivenAdapters.Repository.Memory

  def create_user(
        %Command{
          payload: %UserDto{},
          context: %ContextData{}
        } = command
      ) do
    with {:ok, user} <- Memory.save_user(command.payload, command.context) do
      Logger.info("User created successfully: #{inspect(user)}")
      {:ok, user}
    else
      error ->
        Logger.error("Error creating user: #{inspect(error)}")
        error
    end
  end
end
