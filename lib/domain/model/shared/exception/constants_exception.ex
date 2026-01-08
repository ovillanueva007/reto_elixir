defmodule RetoElixir.Domain.Model.Exception do
  @moduledoc """
  Error business catalog.
  """
  defstruct [
    :status,
    :code,
    :detail,
    :log_code,
    :log_message,
    :additional_info
  ]

  @status_code %{
    BAD_REQUEST: 400,
    UNAUTHORIZED: 401,
    NOT_FOUND: 404,
    CONFLICT: 409,
    INTERNAL_ERROR: 500
  }

  @code %{
    EMPTY_HEADERS: "ER400-01",
    INVALID_VALUES: "SAER400-35",
    UNKNOWN_ERROR_SERVICE: "SAER500-29",
    INVALID_EMAIL_FORMAT: "ER400-100",
    WEAK_PASSWORD: "ER400-200",
    EMAIL_ALREADY_EXISTS: "ER409-100",
    INVALID_BODY: "ER400-300",
    USER_NOT_FOUND: "ER404-100",
    INVALID_CREDENTIALS: "ER401-100"
  }

  @detail %{
    EMPTY_HEADERS: "Faltan cabeceras obligatorias.",
    INVALID_VALUES: "Uno o más datos no poseen un valor válido.",
    UNKNOWN_ERROR_SERVICE: "Ha ocurrido un error desconocido en el servicio",
    INVALID_EMAIL_FORMAT: "Formato de correo electrónico inválido",
    WEAK_PASSWORD: "La contraseña es muy débil",
    EMAIL_ALREADY_EXISTS: "El correo electrónico ya está registrado",
    INVALID_BODY: "El cuerpo de la solicitud no es válido",
    USER_NOT_FOUND: "Usuario no encontrado",
    INVALID_CREDENTIALS: "Credenciales inválidas"
  }

  @log_code %{
    SAER_400_01_80: "SAER400-01-80",
    SAER_400_35_242: "SAER400-35-242",
    SAER_400_35_243: "SAER400-35-243",
    SA500_29_02: "SAER500-29-02",
    SAER_400_99_100: "SAER400_99_100"
  }

  @log_message %{
    SAER_400_01_80: "El objeto de valor MessageId no puede contener su valor null",
    SAER_400_35_242: "El formato del objeto MessageId no es válido",
    SAER_400_35_243: "El patrón del agregado MessageId no es válido",
    SA500_29_02: "Ha ocurrido un error desconocido en el servicio",
    SAER_400_99_100: "Los campos message-id y x-request-id deben enviarse en la solicitud"
  }

  # Base error response functions for each code
  def build_exception({:error, :empty_headers}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:EMPTY_HEADERS],
      detail: @detail[:EMPTY_HEADERS]
    }
  end

  def build_exception({:error, :invalid_values}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:INVALID_VALUES],
      detail: @detail[:INVALID_VALUES]
    }
  end

  def build_exception({:error, :unknown_error_service}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:UNKNOWN_ERROR_SERVICE],
      detail: @detail[:UNKNOWN_ERROR_SERVICE]
    }
  end

  def build_exception({:error, :invalid_email_format}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:INVALID_EMAIL_FORMAT],
      detail: @detail[:INVALID_EMAIL_FORMAT]
    }
  end

  def build_exception({:error, :weak_password}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:WEAK_PASSWORD],
      detail: @detail[:WEAK_PASSWORD]
    }
  end

  def build_exception({:error, :email_already_exists}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:EMAIL_ALREADY_EXISTS],
      detail: @detail[:EMAIL_ALREADY_EXISTS]
    }
  end

  def build_exception({:error, :bad_request}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:INVALID_BODY],
      detail: @detail[:INVALID_BODY]
    }
  end

  def build_exception({:error, :user_not_found}) do
    %{
      status: @status_code[:NOT_FOUND],
      code: @code[:USER_NOT_FOUND],
      detail: @detail[:USER_NOT_FOUND]
    }
  end

  def build_exception({:error, :invalid_credentials}) do
    %{
      status: @status_code[:UNAUTHORIZED],
      code: @code[:INVALID_CREDENTIALS],
      detail: @detail[:INVALID_CREDENTIALS]
    }
  end

  ###############################################
  def build_exception({:error, :message_id_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_80],
      log_message: @log_message[:SAER_400_01_80]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :message_id_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_242],
      log_message: @log_message[:SAER_400_35_242]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :message_id_invalid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_243],
      log_message: @log_message[:SAER_400_35_243]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :signup_headers_empty}) do
    %{
      log_code: @log_code[:SAER_400_99_100],
      log_message: @log_message[:SAER_400_99_100]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :missing_headers_signup}) do
    %{
      log_code: @log_code[:SAER_400_99_100],
      log_message: @log_message[:SAER_400_99_100]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  # Generic error
  def build_exception(error) do
    %{
      log_message: @log_message[:SA500_29_02],
      log_code: @log_code[:SA500_29_02],
      additional_info: inspect(error)
    }
    |> Map.merge(build_exception({:error, :unknown_error_service}))
  end
end
