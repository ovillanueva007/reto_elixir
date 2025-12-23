defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpBuild do
  require Logger
  alias RetoElixir.Domain.Model.Command

  alias RetoElixir.Model.SignUp.UserDto
  alias RetoElixir.Domain.Model.ContextData

  def build_dto_command(body_data, headers) do
    Logger.info("Inside SignUpBuild...")

    with {:ok, user_dto} <-
           UserDto.new(
            #body_data[:"email"] || "",
             Map.get(body_data, :email, ""),
             Map.get(body_data, :password, ""),
             Map.get(body_data, :name, "")
           ),
         {:ok, context} <-
           ContextData.new(Map.get(headers, :MESSAGE_ID), Map.get(headers, :X_REQUEST_ID)) do
      {:ok, %Command{payload: user_dto, context: context}}
    else
      error -> error
    end
  end
end
