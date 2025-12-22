defmodule RetoElixir.Domain.Model.ContextData do
  @moduledoc """
  Represent a ContextData.
  """
  alias RetoElixir.Model.Shared.Common.Model.MessageId

  defstruct [:message_id, :x_request_id]

  @type t :: %__MODULE__{
          message_id: MessageId.t(),
          x_request_id: MessageId.t()
        }

  def new(message_id, x_request_id) do
    with {:ok, new_message_id} <- MessageId.new(message_id),
         {:ok, new_x_request_id} <- resolve_x_request_id(new_message_id, x_request_id) do
      build_context_data(new_message_id, new_x_request_id)
    end
  end


  defp build_context_data(message_id, x_request_id) do
    {:ok,
     %__MODULE__{
       message_id: message_id,
       x_request_id: x_request_id
     }}
  end

  defp resolve_x_request_id(message_id, x_request_id) do
    case is_binary(x_request_id) and String.trim(x_request_id) != "" do
      true ->
        MessageId.new(x_request_id)

      false ->
        {:ok, message_id}
    end
  end
end
