defmodule RetoElixir.DrivenAdapters.Repository.SessionWriteGateway do
  require Logger
  use Agent
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Domain.Model.ContextData
  alias RetoElixir.Model.Shared.Common.SessionDto
  alias RetoElixir.DrivenAdapters.Repository.Memory

  def create_session(
        %Command{
          payload: %SessionDto{},
          context: %ContextData{}
        } = command
      ) do
    with {:ok, session} <- Memory.save_session(command.payload, command.context) do
      Logger.info("Session created successfully: #{inspect(session)}")
      {:ok, session}
    else
      error ->
        Logger.error("Error creating session: #{inspect(error)}")
        error
    end
  end
end
