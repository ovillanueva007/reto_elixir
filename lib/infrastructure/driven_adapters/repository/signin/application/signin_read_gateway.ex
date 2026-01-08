defmodule RetoElixir.DrivenAdapters.Repository.SignInReadGateway do
  require Logger
  use Agent
  alias RetoElixir.Domain.Model.Query
  alias RetoElixir.Domain.Model.ContextData
  alias RetoElixir.Model.Shared.Common.UserDto
  alias RetoElixir.DrivenAdapters.Repository.Memory

  def find_user(
        %Query{
          payload: %UserDto{},
          context: %ContextData{}
        } = query
      ) do
    with {:ok, user} <- Memory.find_by_email(query.payload.email, query.context) do
      Logger.info("User found successfully: #{inspect(user)}")
      {:ok, user}
    else
      error ->
        Logger.error("Error finding user: #{inspect(error)}")
        {:error, :user_not_found}
    end
  end
end
