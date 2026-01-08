defmodule RetoElixir.DrivenAdapters.Repository.Memory do
  require Logger
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{users: %{}, sessions: %{}} end, name: __MODULE__)
  end

  def save_user(user, _ctx) do
    Agent.get_and_update(__MODULE__, fn state ->
      if Map.has_key?(state.users, user.email) do
        {{:error, :email_already_exists}, state}
      else
        new_state = put_in(state.users[user.email], user)
        {{:ok, user}, new_state}
      end
    end)
  end

  def find_by_email(email, _ctx) do
    Agent.get(__MODULE__, fn state ->
      case Map.get(state.users, email) do
        nil -> {:error, :user_not_found}
        user -> {:ok, user}
      end
    end)
  end

  def save_session(session, _ctx) do
    Agent.update(__MODULE__, fn state ->
      put_in(state.sessions[session.session_id], session.user_email)
    end)
    {:ok, session}
  end
end
