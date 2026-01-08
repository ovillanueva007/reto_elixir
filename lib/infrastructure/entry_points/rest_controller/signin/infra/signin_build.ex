defmodule RetoElixir.Infrastructure.EntryPoint.SignIn.SignInBuild do
  require Logger
  alias RetoElixir.Domain.Model.Query

  alias RetoElixir.Model.Shared.Common.UserDto
  alias RetoElixir.Domain.Model.ContextData

  def build_dto_query(body_data, headers) do
    with {:ok, user_dto} <-
           UserDto.new_signin(
            body_data[:email] || "",
            body_data[:password] || ""
           ),
         {:ok, context} <-
           ContextData.new(Map.get(headers, :MESSAGE_ID), Map.get(headers, :X_REQUEST_ID)) do
      {:ok, %Query{payload: user_dto, context: context}}
    else
      error -> error
    end
  end
end
