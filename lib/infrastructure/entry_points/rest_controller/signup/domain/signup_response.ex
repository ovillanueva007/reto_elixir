defmodule RetoElixir.Infrastructure.EntryPoint.SignUp.SignUpBuildRes do

  def build(user) do
    {:ok, %{
      email: user[:email],
      name: user[:name]
    }}
  end
end
