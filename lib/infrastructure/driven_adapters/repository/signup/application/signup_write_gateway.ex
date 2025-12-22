defmodule RetoElixir.DrivenAdapters.Repository.SignUpWriteGateway do
  use Agent
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Model.SignUp.UserDto
  alias RetoElixir.Domain.Model.ContextData

  def start_link(_opts) do
    Agent.start_link(fn -> %{users: %{}, sessions: %{}} end, name: __MODULE__)
  end

  def create_user(
        %Command{
          payload: %UserDto{},
          context: %ContextData{}
        } = command
      ) do
    # case user do
    save_user(command.payload)
    # end
  end

  defp save_user(user) do
    Agent.get_and_update(__MODULE__, fn state ->
      if Map.has_key?(state.users, user.email) do
        {{:error, :email_already_exists}, state}
      else
        new_state = put_in(state.users[user.email], user)
        {{:ok, user}, new_state}
      end
    end)
  end
end
