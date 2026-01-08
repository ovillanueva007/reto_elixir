defmodule RetoElixir.UseCase.SignIn.SignInUseCase do
  require Logger
  alias RetoElixir.Domain.Model.Query
  alias RetoElixir.Domain.Model.Command
  alias RetoElixir.Domain.Model.ContextData
  alias RetoElixir.Model.Shared.Common.UserDto
  alias RetoElixir.Model.Shared.Common.SessionDto

  @signin_gateway_read Application.compile_env(
                         :reto_elixir,
                         :signin_gateway_read
                       )
  @session_gateway_write Application.compile_env(
                           :reto_elixir,
                           :session_gateway_write
                         )

  def execute(
        %Query{
          payload: %UserDto{},
          context: %ContextData{}
        } = query
      ) do
    with {:ok, user} <- @signin_gateway_read.find_user(query),
         {:ok, true} <- validate_password(user, query.payload.password),
         {:ok, session} <- create_session(user, query.context) do
      {:ok, session}
    else
      error -> error
    end
  end

  defp validate_password(user, password) do
    if user.password == password do
      {:ok, true}
    else
      {:error, :invalid_credentials}
    end
  end

  defp create_session(user, context) do
    session_id = UUID.uuid4()
    {:ok, session} = SessionDto.new(session_id, user.email)

    command = %Command{
      payload: session,
      context: context
    }

    @session_gateway_write.create_session(command)
  end
end
