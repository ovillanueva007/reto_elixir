defmodule RetoElixir.Model.Shared.Common.SessionDto do
  defstruct [:session_id, :user_email]

  @type t :: %__MODULE__{
          session_id: String.t(),
          user_email: String.t()
        }

  def new(session_id, user_email) do
    {:ok,
     %__MODULE__{
       session_id: session_id,
       user_email: user_email
     }}
  end
end
