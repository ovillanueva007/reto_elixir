defmodule RetoElixir.DrivenAdapters.Repository.SignUpWriteGateway do
  require Logger
  use Agent
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Model.SignUp.UserDto
  alias RetoElixir.Domain.Model.ContextData

  def start_link(_opts) do
    users = %{}
    sessions = %{}
    Agent.start_link(fn -> %{users: users, sessions: sessions} end, name: __MODULE__)
  end

  def create_user(
        %Command{
          payload: %UserDto{},
          context: %ContextData{}
        } = command
      ) do
    case save_user(%{email: command.payload.email, password: command.payload.password}) do
      :ok -> {:ok, :ok}
      {:error, :email_already_exists} -> {:error, :email_already_exists}
      _ -> {:error, :unexpected_error}
    end
    Logger.info("Leaving SignUpWriteGateway.create_user...")
  end

  # Puerto: create_user/1
  # @impl true
  def save_user(%{email: email, password: password}) do
    Logger.info("Inside SignUpWriteGateway.save_user...")

    down = String.downcase(email)

    Agent.get_and_update(__MODULE__, fn state ->
      if Map.has_key?(state.users, down) do
        {{:error, :email_already_exists}, state}
      else
        user = %{id: UUID.uuid4(), email: email, password: password}
        new_state = put_in(state[:users][down], user)
        {:ok, new_state}
      end
      #Logger.info(state.users)
    end)
    #|> case do
    #  :ok -> :ok
    #  other -> other
    #end
    Logger.info("Leaving SignUpWriteGateway.save_user...")
  end
end
