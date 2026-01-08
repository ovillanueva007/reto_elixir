defmodule RetoElixir.Model.Shared.Common.Name do
  alias RetoElixir.Model.Shared.Common.Validate.NameValidate

  defstruct [:name]

  @type t :: %__MODULE__{
          name: String.t()
        }

  def new(name) do
    #case NameValidate.validate(name) do
      #{:ok, true} ->
        {:ok,
         %__MODULE__{
           name: name
         }}

    #  error ->
    #    error
    #end
  end
end
