defmodule RetoElixir.Infrastructure.EntryPoint.SignIn.SignInBuildResponse do

  def build(session) do
    {:ok, %{
      session_id: session.session_id
    }}
  end
end
