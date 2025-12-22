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
    NOT_FOUND: 404,
    CONFLICT: 409,
    INTERNAL_ERROR: 500
  }

  @code %{
    EMPTY_HEADERS: "ER400-01",
    SAE_EMPTY_HEADERS: "SAER400-01",
    EMPTY_VALUES: "ER400-03",
    SAE_EMPTY_VALUES: "SAER400-03",
    INVALID_VALUES: "SAER400-35",
    ROLE_WITHOUT_FUNCTIONALITIES: "BPER409-140",
    GRANULAR_GROUP_NOT_EXIST: "BPER409-141",
    INACTIVE_CHANNEL: "ER409-50",
    NOT_FOUND_RELATION: "ER409-52",
    RELATION_NOT_FOUND: "BPER409-52",
    ROLE_NOT_FOUND: "BPER409-67",
    NO_PERMISSION: "BPER409-85",
    PRODUCT_GROUP_NOT_EXIST: "BPER409-92",
    INTERNAL_REDIS_ERROR: "ER500-27",
    PERMISSION_WITHOUT_FUNCTIONALITIES: "BPER409-56",
    REGISTER_NOT_FOUND: "ER409-51",
    CONSUMER_NOT_FOUND: "ER409-36",
    CONSUMER_EMPTY_FOUND: "ER409-36-20",
    UNKNOWN_GET_CONSUMER: "SAER500-04",
    UNKNOWN_ERROR_SERVICE: "SAER500-29",
    PARAMETER_SUID_CONSUMER_EMPTY: "ER409-36-06",
    PARAMETER_NO_FOUND: "ER404-16",
    PARAMETER_ERROR: "ER500-01",
    NO_EXECUTE_PERMISSION: "ER409-85",
    UNKNOWN_ERROR_CONSUMER_SERVICE: "ER500-10",
    SEGMENT_UPDATE_ERROR: "ER409-127",
    NO_FOUND_RECORDS: "BPER409-109"
  }

  @detail %{
    EMPTY_HEADERS: "Faltan cabeceras obligatorias.",
    EMPTY_VALUES: "Faltan parámetros obligatorios.",
    INVALID_VALUES: "Uno o más datos no poseen un valor válido.",
    ROLE_WITHOUT_FUNCTIONALITIES:
      "Capacidades de la funcionalidades y privilegios no existen para el rol a consultar",
    GRANULAR_GROUP_NOT_EXIST: "Grupo de productos granular no existe.",
    INACTIVE_CHANNEL: "El canal no se encuentra activo o no existe.",
    NOT_FOUND_RELATION: "No se encuentran registros de relacionamiento.",
    RELATION_NOT_FOUND: "No se encuentran registros de relacionamiento.",
    ROLE_NOT_FOUND: "No se encuentran registros de rol asociado.",
    NO_PERMISSION: "No cuenta con los permisos para ejecutar la acción.",
    PRODUCT_GROUP_NOT_EXIST: "Grupo de productos no existe.",
    INTERNAL_REDIS_ERROR: "Ha ocurrido un error interno en el servicio",
    PERMISSION_WITHOUT_FUNCTIONALITIES: "El usuario no tiene funcionalidades asociadas",
    REGISTER_NOT_FOUND: "Registro no encontrado.",
    CONSUMER_NOT_FOUND: "El consumidor no se encuentra registrado",
    CONSUMER_EMPTY_FOUND: "El consumidor no se encuentra registrado",
    PARAMETER_SUID_CONSUMER_EMPTY: "El consumidor no se encuentra registrado",
    UNKNOWN_GET_CONSUMER: "Ha ocurrido un error interno en el servicio",
    UNKNOWN_ERROR_SERVICE: "Ha ocurrido un error desconocido en el servicio",
    PARAMETER_NO_FOUND: "No se encuentran resultados para el parámetro consultado",
    NO_EXECUTE_PERMISSION: "No cuenta con los permisos para ejecutar la acción.",
    UNKNOWN_ERROR_CONSUMER_SERVICE: "Ha ocurrido un error interno en el servicio",
    SEGMENT_UPDATE_ERROR: "No se puede actualizar el segmento.",
    NO_FOUND_RECORDS: "Pagina no cuenta con registros"
  }

  @log_code %{
    SAER_400_01_69: "SAER400-01-69",
    SAER_400_01_70: "SAER400-01-70",
    SAER_400_01_71: "SAER400-01-71",
    SAER_400_01_72: "SAER400-01-72",
    SAER_400_01_73: "SAER400-01-73",
    SAER_400_01_74: "SAER400-01-74",
    SAER_400_01_75: "SAER400-01-75",
    SAER_400_01_76: "SAER400-01-76",
    SAER_400_01_77: "SAER400-01-77",
    SAER_400_01_78: "SAER400-01-78",
    SAER_400_01_79: "SAER400-01-79",
    SAER_400_01_80: "SAER400-01-80",
    SAER_400_03_140: "SAER400-03-140",
    SAER_400_03_141: "SAER400-03-141",
    SAER_400_03_142: "SAER400-03-142",
    SAER_400_03_143: "SAER400-03-143",
    SAER_400_03_144: "SAER400-03-144",
    SAER_400_03_145: "SAER400-03-145",
    SAER_400_03_146: "SAER400-03-146",
    SAER_400_03_147: "SAER400-03-147",
    SAER_400_03_148: "SAER400-03-148",
    SAER_400_03_149: "SAER400-03-149",
    SAER_400_03_150: "SAER400-03-150",
    SAER_400_03_151: "SAER400-03-151",
    SAER_400_03_152: "SAER400-03-152",
    SAER_400_03_153: "SAER400-03-153",
    SAER_400_03_154: "SAER400-03-154",
    SAER_400_35_226: "SAER400-35-226",
    SAER_400_35_227: "SAER400-35-227",
    SAER_400_35_228: "SAER400-35-228",
    SAER_400_35_229: "SAER400-35-229",
    SAER_400_35_230: "SAER400-35-230",
    SAER_400_35_231: "SAER400-35-231",
    SAER_400_35_232: "SAER400-35-232",
    SAER_400_35_233: "SAER400-35-233",
    SAER_400_35_234: "SAER400-35-234",
    SAER_400_35_235: "SAER400-35-235",
    SAER_400_35_236: "SAER400-35-236",
    SAER_400_35_237: "SAER400-35-237",
    SAER_400_35_238: "SAER400-35-238",
    SAER_400_35_239: "SAER400-35-239",
    SAER_400_35_240: "SAER400-35-240",
    SAER_400_35_241: "SAER400-35-241",
    SAER_400_35_242: "SAER400-35-242",
    SAER_400_35_243: "SAER400-35-243",
    SAER_400_35_244: "SAER400-35-244",
    SAER_400_35_245: "SAER400-35-245",
    SAER_400_35_246: "SAER400-35-246",
    ER409_36_20: "ER409-36-20",
    ER409_36_21: "ER409-36-21",
    ER409_36_22: "ER409-36-22",
    SAER_409_51_11: "ER409-51-11",
    SAER_409_51_12: "ER409-51-12",
    ER409_52_21: "ER409-52-21",
    BPER_409_52_49: "BPER409-52-49",
    BPER_409_56_02: "BPER409-56-02",
    BPER_409_85_151: "BPER409-85-151",
    BPER_409_85_152: "BPER409-85-152",
    BPER_409_92_06: "BPER409-92-06",
    BPER_409_140_03: "BPER409-140-03",
    BPER_409_141_04: "BPER409-141-04",
    ER409_67_03: "ER409-67-03",
    ER500_27_09: "ER500-27-09",
    ER500_27_10: "ER500-27-10",
    ER500_27_11: "ER500-27-11",
    ER500_27_12: "ER500-27-12",
    ER500_27_13: "ER500-27-13",
    ER500_27_14: "ER500-27-14",
    ER500_27_15: "ER500-27-15",
    ER500_27_16: "ER500-27-16",
    SAER_500_04_15: "SAER500-04-15",
    SAER_500_04_16: "SAER500-04-16",
    ER409_50_02: "ER409-50-02",
    ER409_50_03: "ER409-50-03",
    SA500_29_02: "SAER500-29-02",
    ER409_36_06: "ER409-36-06",
    ER404_16_01: "ER404-16-01",
    ER500_01_04: "ER500-01-04",
    ER400_01_12: "ER400-01-12",
    ER400_01_13: "ER400-01-13",
    ER400_01_14: "ER400-01-14",
    ER400_01_15: "ER400-01-15",
    ER400_35_110: "ER400-35-110",
    ER400_35_111: "ER400-35-111",
    ER400_35_112: "ER400-35-112",
    ER409_36_23: "ER409-36-23",
    ER409_36_24: "ER409-36-24",
    ER400_01_22: "ER400-01-22",
    ER409_85_91: "ER409-85-91",
    ER409_85_92: "ER409-85-92",
    ER500_27_17: "ER500-27-17",
    ER500_10_07: "ER500-10-07",
    ER409_36_22: "ER409-36-22",
    ER500_10_08: "ER500-10-08",
    ER409_127_07: "ER409-127-07",
    BPER409_109_12: "BPER409-109-12",
    ER500_10_09: "ER500-10-09",
    ER409_127_08: "ER409-127-08",
    ER409_127_09: "ER409-127-09",
    ER409_127_10: "ER409-127-10",
    ER409_127_11: "ER409-127-11",
    ER409_127_12: "ER409-127-12",
    SAER_400_35_259: "SAER400-35-259",
    SAER_400_35_260: "SAER400-35-260",
    SAER_400_35_261: "SAER400-35-261",
    SAER_400_35_262: "SAER400-35-262",
    SAER_400_35_263: "SAER400-35-263",
    SAER_400_35_264: "SAER400-35-264",
    SAER_400_35_265: "SAER400-35-265",
    SAER_400_35_266: "SAER400-35-266",
    SAER_400_35_267: "SAER400-35-267",
    SAER_400_35_268: "SAER400-35-268",
    SAER_400_35_269: "SAER400-35-269",
    SAER_400_35_270: "SAER400-35-270",
    SAER_400_35_271: "SAER400-35-271",
    SAER_400_35_272: "SAER400-35-272",
    SAER_400_35_273: "SAER400-35-273"
  }

  @log_message %{
    SAER_400_01_69: "El objeto headers debe eviarse en las cabeceras de la solicitud",
    SAER_400_01_70: "El campo message-id y consumer-acronym debe enviarse en la solicitud",
    SAER_400_01_71: "El objeto headers debe eviarse en las cabeceras de la solicitud",
    SAER_400_01_72:
      "El campo consumer-acronym, consumer-segment, message-id, relations-identifier, aid-creator debe enviarse en la solicitud",
    SAER_400_01_73: "El objeto headers debe eviarse en las cabeceras de la solicitud",
    SAER_400_01_74:
      "El campo consumer-acronym, consumer-segment, message-id debe eviarse en las cabeceras de la solicitud",
    SAER_400_01_75: "El objeto de valor AidCreator no puede contener su valor null",
    SAER_400_01_76: "El objeto de valor ConsumerAcronym no puede contener su valor null",
    SAER_400_01_77: "El objeto de valor ConsumerSegmentTransform no puede contener su valor null",
    SAER_400_01_78: "El objeto de valor IdRelationship no puede contener su valor null",
    SAER_400_01_79: "El objeto de valor IdRole no puede contener su valor null",
    SAER_400_01_80: "El objeto de valor MessageId no puede contener su valor null",
    SAER_400_03_140: "El objeto body debe enviarse en el cuerpo de la solicitud",
    SAER_400_03_141: "El campo data debe enviarse dentro del cuerpo de la solicitud",
    SAER_400_03_142: "El campo idRelationship debe enviarse dentro del cuerpo de la solicitud",
    SAER_400_03_143: "El campo idRelationship no puede estar vacío",
    SAER_400_03_144: "El objeto de valor ConsumerSegmentTransform no puede ser null",
    SAER_400_03_145: "El campo consumer-acronym no puede estar vacío",
    SAER_400_03_146: "El campo del agregado ConsumerAcronym no puede estar vacío",
    SAER_400_03_147: "El campo del agregado AidCreator no puede estar vacío",
    SAER_400_03_148: "El campo del agregado IdRole no puede estar vacío",
    SAER_400_03_149: "El campo del agregado MessageId no puede estar vacío",
    SAER_400_03_150: "El objeto body debe enviarse en el cuerpo de la solicitud",
    SAER_400_03_151: "El campo data debe enviarse dentro del cuerpo de la solicitud",
    SAER_400_03_152: "El campo role debe enviarse dentro del campo data de la solicitud",
    SAER_400_03_153: "El campo id debe enviarse dentro del campo role en data de la solicitud",
    SAER_400_03_154: "El objeto id dentro de data posee un valor desconocido",
    ER409_67_03: "No se retorna registro en la consulta de capacidades del rol.",
    SAER_400_35_226: "El formato del campo idRelationship no es válido",
    SAER_400_35_227: "El campo idRelationship no puede ser un valor en blanco",
    SAER_400_35_228: "La longitud del campo idRelationship es inválida",
    SAER_400_35_229: "El patrón del campo idRelationship es inválido",
    SAER_400_35_230: "El formato del campo consumer-acronym no es válido",
    SAER_400_35_231: "La longitud del campo consumer-acronym es inválida",
    SAER_400_35_232: "El formato del agregado ConsumerSegmentTransform no es válido",
    SAER_400_35_233:
      "El formato del agregado ConsumerSegmentTransform no posee una longitud válida",
    SAER_400_35_234: "El formato del agregado AidCreator no es válido",
    SAER_400_35_235: "El valor del objecto de valor AidCreator no puede ser un valor en blanco",
    SAER_400_35_236: "La longitud del agregado AidCreator no es válida",
    SAER_400_35_237: "El valor del objeto AidCreator no cumple con el patrón requerido",
    SAER_400_35_238: "El formato del objeto IdRole no es válido",
    SAER_400_35_239: "El campo IdRole no puede ser un valor en blanco",
    SAER_400_35_240: "La longitud del agregado IdRole no es válida",
    SAER_400_35_241: "El patrón del agregado IdRole no es válido",
    SAER_400_35_242: "El formato del objeto MessageId no es válido",
    SAER_400_35_243: "El patrón del agregado MessageId no es válido",
    SAER_400_35_244: "El patrón del agregado ConsumerSegmentTransform no es válido",
    SAER_400_35_245: "La longitud del agregado ConsumerSegmentTransform no es válida",
    SAER_400_35_246: "El formato del agregado ConsumerAcronym no es válida",
    ER409_36_20: "Error en SUID get alias identity nos da un 204 no encontró coincidencias",
    ER409_36_21: "Error en SUID get alias identity nos da un 204 no encontró coincidencias",
    ER409_36_22: "Error en SUID get alias identity nos da un 400 no encontró coincidencias",
    SAER_409_51_11: "Error en SUID get alias identity nos da un 204 no encontró coincidencias",
    SAER_409_51_12: "Error en SUID get alias identity nos da un 204 no encontró coincidencias",
    ER409_52_21: "No se encuentran registros de relacionamiento.",
    BPER_409_52_49: "No se retorna ningun registro en la consultada de relación por id.",
    BPER_409_56_02: "No se encontraron funcionalidades asociadas al rol",
    BPER_409_85_151:
      "No existe relación entre el aid de la relación consultada y el aid de los permisos de el rol.",
    BPER_409_85_152: "No fue posible consultar la información de permisos en cache.",
    BPER_409_92_06:
      "No se encontraron registros en la consulta del grupo de productos granulares.",
    BPER_409_140_03:
      "No se encontro registro de funcionalidad y privilegio asociado al rol a consultar",
    BPER_409_141_04:
      "El estado del grupo de productos consultado se encuentra en un estado diferente a activo.",
    ER500_27_09:
      "Ha ocurrido un error ejecutando el comando recibido en el componente de cache read",
    ER500_27_10: "Ha ocurrido un error al deserializar la respuesta de cache",
    ER500_27_11: "Ha ocurrido un error al lanzar el comando de consulta de redis",
    ER500_27_12: "Ha ocurrido un error al serializar la informacion de redis",
    ER500_27_13: "Ha ocurrido un error al guardar la informacion de redis",
    ER500_27_14: "Ha ocurrido un error ejecutando el comando para redis read",
    ER500_27_15: "Ha ocurrido un error ejecutando el comando para guardar el getconsumer",
    ER500_27_16: "Ha ocurrido un error ejecutando el comando para redis write",
    SAER_500_04_15: "Se produjo un error en la consulta de la información del consumidor.",
    SAER_500_04_16: "Se produjo un error no especificado en suid getConsumer",
    ER409_50_02: "Error en suid getConsumer, El estado status no es Activo",
    ER409_50_03: "Error en suid getConsumer, El estado status no es Activo",
    SA500_29_02: "Ha ocurrido un error desconocido en el servicio",
    ER409_36_06: "No se encontraron registros del consumidor del SUID en el sistema.",
    ER404_16_01: "No se encuentran resultados para el parámetro consultado",
    ER500_01_04: "Error al obtener los parámetros del servicio.",
    ER400_01_22:
      "Las cabeceras 'consumer-acronym', 'message-id' y 'consumer_masam', son obligatorias.",
    ER400_35_110: "El parámetro 'message-id' no es un valor valido.",
    ER400_35_111: "El parámetro 'consumer-acronym' no es un valor valido.",
    ER400_35_112: "El parámetro 'consumer' no es un valor valido.",
    ER409_36_23:
      "Se retorno un estado 204 en la consulta al servico externo de suid de la información del consumidor de masam.",
    ER409_36_24:
      "Se retorno un estado 400 en la consulta al servico externo de suid de la información del consumidor de masam.",
    ER409_85_91: "No fue posible obtener la información del consumidor en masam en cache.",
    ER409_85_92: "No fue posible consultar la información del consumidor en masam en cache.",
    ER500_27_17:
      "Ha ocurrido un error ejecutando el comando recibido en el componente de redis read",
    ER500_10_07:
      "Ocurrio un error no controlado en la respuesta de la solicitud al servio externo '/getConsumerMasam'.",
    ER409_36_22: "El consumidor de masam no se encuentra en operacion.",
    ER500_10_08:
      "Ocurrio un error no controlado en la validación del segmento de la información del consumidor de masam.",
    ER409_127_07:
      "No se encontro el segmento del consumidor al realizar la consulta de la data del consumidor.",
    BPER409_109_12: "No se encontraron registros en la página de la consulta de consumidores.",
    ER500_10_09:
      "Ocurrio un error no controlado en la consulta la existencia de la información del consumidor de masam.",
    ER409_127_08: "Ocurrio un error al actualizar el segmento del canal.",
    ER409_127_09: "No se retorno ningun registro de la información del consumidor a actualizar.",
    ER409_127_10: "No se retorno ningun registro de la información del consumidor.",
    ER409_127_11:
      "Se encontro el segmento igual a '0' del consumidor al realizar la validación consumidor.",
    ER409_127_12: "El segmento del canal ya se encuentra registrado.",
    SAER_400_35_259: "El formato del agregado CodeParameter no es válido",
    SAER_400_35_260: "El agregado CodeParameter no es un tipo valido",
    SAER_400_35_261: "El formato del agregado PkDelegate no es válido",
    SAER_400_35_262: "El agregado PkDelegate no es un tipo valido",
    SAER_400_35_263: "El agregado ExpirationDays no es un numero positivo",
    SAER_400_35_264: "El agregado ExpirationDays no es un numero valido",
    SAER_400_35_265: "El tipo del agregado ExpirationDays no es válido",
    SAER_400_35_266: "El agregado DelegatesNumber no es un numero positivo",
    SAER_400_35_267: "El agregado DelegatesNumber excede el valor máximo permitido",
    SAER_400_35_268: "El agregado DelegatesNumber no es un numero valido",
    SAER_400_35_269: "El tipo del agregado DelegatesNumber no es válido",
    SAER_400_35_270: "El agregado ChannelGroup no tiene un tipo válido",
    SAER_400_35_271: "El agregado ChannelGroup no tiene un formato válido alfanumerico",
    SAER_400_35_272: "El agregado Channel no tiene un tipo válido",
    SAER_400_35_273: "El agregado Channel no tiene un formato válido alfanumerico"
  }

  # Base error response functions for each code
  def build_exception({:error, :empty_headers}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:EMPTY_HEADERS],
      detail: @detail[:EMPTY_HEADERS]
    }
  end

  def build_exception({:error, :sae_empty_headers}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:SAE_EMPTY_HEADERS],
      detail: @detail[:EMPTY_HEADERS]
    }
  end

  def build_exception({:error, :empty_values}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:EMPTY_VALUES],
      detail: @detail[:EMPTY_VALUES]
    }
  end

  def build_exception({:error, :sae_empty_values}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:SAE_EMPTY_VALUES],
      detail: @detail[:EMPTY_VALUES]
    }
  end

  def build_exception({:error, :invalid_values}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:INVALID_VALUES],
      detail: @detail[:INVALID_VALUES]
    }
  end

  def build_exception({:error, :role_without_functionalities}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:ROLE_WITHOUT_FUNCTIONALITIES],
      detail: @detail[:ROLE_WITHOUT_FUNCTIONALITIES]
    }
  end

  def build_exception({:error, :granular_group_not_exist}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:GRANULAR_GROUP_NOT_EXIST],
      detail: @detail[:GRANULAR_GROUP_NOT_EXIST]
    }
  end

  def build_exception({:error, :inactive_channel}) do
    %{
      status: @status_code[:BAD_REQUEST],
      code: @code[:INACTIVE_CHANNEL],
      detail: @detail[:INACTIVE_CHANNEL]
    }
  end

  def build_exception({:error, :not_found_relation}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:NOT_FOUND_RELATION],
      detail: @detail[:NOT_FOUND_RELATION]
    }
  end

  def build_exception({:error, :relation_not_found}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:RELATION_NOT_FOUND],
      detail: @detail[:RELATION_NOT_FOUND]
    }
  end

  def build_exception({:error, :role_not_found}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:ROLE_NOT_FOUND],
      detail: @detail[:ROLE_NOT_FOUND]
    }
  end

  def build_exception({:error, :no_permission}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:NO_PERMISSION],
      detail: @detail[:NO_PERMISSION]
    }
  end

  def build_exception({:error, :product_group_not_exist}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:PRODUCT_GROUP_NOT_EXIST],
      detail: @detail[:PRODUCT_GROUP_NOT_EXIST]
    }
  end

  def build_exception({:error, :internal_redis_error}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:INTERNAL_REDIS_ERROR],
      detail: @detail[:INTERNAL_REDIS_ERROR]
    }
  end

  def build_exception({:error, :permission_without_functionalities}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:PERMISSION_WITHOUT_FUNCTIONALITIES],
      detail: @detail[:PERMISSION_WITHOUT_FUNCTIONALITIES]
    }
  end

  def build_exception({:error, :register_not_found}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:REGISTER_NOT_FOUND],
      detail: @detail[:REGISTER_NOT_FOUND]
    }
  end

  def build_exception({:error, :consumer_not_found}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:CONSUMER_NOT_FOUND],
      detail: @detail[:CONSUMER_NOT_FOUND]
    }
  end

  def build_exception({:error, :unknown_get_consumer}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:UNKNOWN_GET_CONSUMER],
      detail: @detail[:UNKNOWN_GET_CONSUMER]
    }
  end

  def build_exception({:error, :unknown_error_service}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:UNKNOWN_ERROR_SERVICE],
      detail: @detail[:UNKNOWN_ERROR_SERVICE]
    }
  end

  def build_exception({:error, :retrieve_relation_headers_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_69],
      log_message: @log_message[:SAER_400_01_69]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :missing_headers_aid_or_relation_get_relation}) do
    %{
      log_code: @log_code[:SAER_400_01_74],
      log_message: @log_message[:SAER_400_01_74]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :aid_creator_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_75],
      log_message: @log_message[:SAER_400_01_75]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :consumer_acronym_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_76],
      log_message: @log_message[:SAER_400_01_76]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :consumer_channel_transform_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_77],
      log_message: @log_message[:SAER_400_01_77]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :id_relationship_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_78],
      log_message: @log_message[:SAER_400_01_78]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :id_role_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_79],
      log_message: @log_message[:SAER_400_01_79]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :message_id_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_80],
      log_message: @log_message[:SAER_400_01_80]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :missing_headers_retrieve_role_capabilities}) do
    %{
      log_code: @log_code[:SAER_400_01_70],
      log_message: @log_message[:SAER_400_01_70]
    }
    |> Map.merge(build_exception({:error, :sae_empty_headers}))
  end

  def build_exception({:error, :get_permission_headers_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_71],
      log_message: @log_message[:SAER_400_01_71]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :missing_headers_get_permission}) do
    %{
      log_code: @log_code[:SAER_400_01_72],
      log_message: @log_message[:SAER_400_01_72]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :retrieve_role_capabilities_headers_empty}) do
    %{
      log_code: @log_code[:SAER_400_01_73],
      log_message: @log_message[:SAER_400_01_73]
    }
    |> Map.merge(build_exception({:error, :sae_empty_headers}))
  end

  def build_exception({:error, :get_relation_empty_body}) do
    %{
      log_code: @log_code[:SAER_400_03_140],
      log_message: @log_message[:SAER_400_03_140]
    }
    |> Map.merge(build_exception({:error, :sae_empty_values}))
  end

  def build_exception({:error, :retrieve_role_capabilities_empty_body}) do
    %{
      log_code: @log_code[:SAER_400_03_140],
      log_message: @log_message[:SAER_400_03_140]
    }
    |> Map.merge(build_exception({:error, :empty_values}))
  end

  def build_exception({:error, :get_relation_empty_data_body}) do
    %{
      log_code: @log_code[:SAER_400_03_141],
      log_message: @log_message[:SAER_400_03_141]
    }
    |> Map.merge(build_exception({:error, :empty_values}))
  end

  def build_exception({:error, :invalid_req_validate_field_data}) do
    %{
      log_code: @log_code[:SAER_400_03_151],
      log_message: @log_message[:SAER_400_03_151]
    }
    |> Map.merge(build_exception({:error, :sae_empty_values}))
  end

  def build_exception({:error, :invalid_req_validate_field_role}) do
    %{
      log_code: @log_code[:SAER_400_03_152],
      log_message: @log_message[:SAER_400_03_152]
    }
    |> Map.merge(build_exception({:error, :sae_empty_values}))
  end

  def build_exception({:error, :invalid_req_validate_field_role_id_missing}) do
    %{
      log_code: @log_code[:SAER_400_03_153],
      log_message: @log_message[:SAER_400_03_153]
    }
    |> Map.merge(build_exception({:error, :sae_empty_values}))
  end

  def build_exception({:error, :invalid_req_validate_field_role_id_invalid}) do
    %{
      log_code: @log_code[:SAER_400_03_154],
      log_message: @log_message[:SAER_400_03_154]
    }
    |> Map.merge(build_exception({:error, :sae_empty_values}))
  end

  def build_exception({:error, :get_relation_empty_id_relation_body}) do
    %{
      log_code: @log_code[:SAER_400_03_142],
      log_message: @log_message[:SAER_400_03_142]
    }
    |> Map.merge(build_exception({:error, :empty_values}))
  end

  def build_exception({:error, :empty_id_relationship}) do
    %{
      log_code: @log_code[:SAER_400_03_143],
      log_message: @log_message[:SAER_400_03_143]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_consumer_channel_transform}) do
    %{
      log_code: @log_code[:SAER_400_03_144],
      log_message: @log_message[:SAER_400_03_144]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_acronym}) do
    %{
      log_code: @log_code[:SAER_400_03_145],
      log_message: @log_message[:SAER_400_03_145]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_consumer_acronym}) do
    %{
      log_code: @log_code[:SAER_400_03_146],
      log_message: @log_message[:SAER_400_03_146]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_aid_creator}) do
    %{
      log_code: @log_code[:SAER_400_03_147],
      log_message: @log_message[:SAER_400_03_147]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_id_role}) do
    %{
      log_code: @log_code[:SAER_400_03_148],
      log_message: @log_message[:SAER_400_03_148]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_message_id}) do
    %{
      log_code: @log_code[:SAER_400_03_149],
      log_message: @log_message[:SAER_400_03_149]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_message_id}) do
    %{
      log_code: @log_code[:SAER_400_03_150],
      log_message: @log_message[:SAER_400_03_150]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :invalid_format_id_relationship}) do
    %{
      log_code: @log_code[:SAER_400_35_226],
      log_message: @log_message[:SAER_400_35_226]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_relationship_blank}) do
    %{
      log_code: @log_code[:SAER_400_35_227],
      log_message: @log_message[:SAER_400_35_227]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_relationship_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_228],
      log_message: @log_message[:SAER_400_35_228]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_relationship_invalid_pattern}) do
    %{
      log_code: @log_code[:SAER_400_35_229],
      log_message: @log_message[:SAER_400_35_229]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :invalid_format_consumer_acronym}) do
    %{
      log_code: @log_code[:SAER_400_35_230],
      log_message: @log_message[:SAER_400_35_230]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :consumer_acronym_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_231],
      log_message: @log_message[:SAER_400_35_231]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :consumer_acronym_invalid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_246],
      log_message: @log_message[:SAER_400_35_246]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_segment_transform_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_232],
      log_message: @log_message[:SAER_400_35_232]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_segment_transform_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_233],
      log_message: @log_message[:SAER_400_35_233]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :aid_creator_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_234],
      log_message: @log_message[:SAER_400_35_234]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :aid_creator_blank}) do
    %{
      log_code: @log_code[:SAER_400_35_235],
      log_message: @log_message[:SAER_400_35_235]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :aid_creator_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_236],
      log_message: @log_message[:SAER_400_35_236]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :aid_creator_invalid_pattern}) do
    %{
      log_code: @log_code[:SAER_400_35_237],
      log_message: @log_message[:SAER_400_35_237]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_role_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_238],
      log_message: @log_message[:SAER_400_35_238]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_role_blank}) do
    %{
      log_code: @log_code[:SAER_400_35_239],
      log_message: @log_message[:SAER_400_35_239]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_role_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_240],
      log_message: @log_message[:SAER_400_35_240]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :id_role_invalid_pattern}) do
    %{
      log_code: @log_code[:SAER_400_35_241],
      log_message: @log_message[:SAER_400_35_241]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
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

  def build_exception({:error, :consumer_channel_transform_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_244],
      log_message: @log_message[:SAER_400_35_244]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :consumer_channel_transform_invalid_length}) do
    %{
      log_code: @log_code[:SAER_400_35_245],
      log_message: @log_message[:SAER_400_35_245]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :relation_not_found_error}) do
    %{
      log_code: @log_code[:BPER_409_52_49],
      log_message: @log_message[:BPER_409_52_49]
    }
    |> Map.merge(build_exception({:error, :relation_not_found}))
  end

  def build_exception({:error, :different_aid}) do
    %{
      log_code: @log_code[:BPER_409_85_151],
      log_message: @log_message[:BPER_409_85_151]
    }
    |> Map.merge(build_exception({:error, :no_permission}))
  end

  def build_exception({:error, :role_not_found_in_cache}) do
    %{
      log_code: @log_code[:BPER_409_85_152],
      log_message: @log_message[:BPER_409_85_152]
    }
    |> Map.merge(build_exception({:error, :no_permission}))
  end

  def build_exception({:error, :unknown_error_in_cache_permission}) do
    %{
      log_code: @log_code[:ER500_27_09],
      log_message: @log_message[:ER500_27_09]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :unknown_deserialize_in_cache_permission}) do
    %{
      log_code: @log_code[:ER500_27_10],
      log_message: @log_message[:ER500_27_10]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :unknown_command_in_cache_permission}) do
    %{
      log_code: @log_code[:ER500_27_11],
      log_message: @log_message[:ER500_27_11]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :permission_without_functionalities_error}) do
    %{
      log_code: @log_code[:BPER_409_56_02],
      log_message: @log_message[:BPER_409_56_02]
    }
    |> Map.merge(build_exception({:error, :permission_without_functionalities}))
  end

  def build_exception({:error, :unknown_save_permission_cache}) do
    %{
      log_code: @log_code[:ER500_27_12],
      log_message: @log_message[:ER500_27_12]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :unknown_save_permission_command_cache}) do
    %{
      log_code: @log_code[:ER500_27_13],
      log_message: @log_message[:ER500_27_13]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :unknown_read_consumer_cache, response}) do
    %{
      log_code: @log_code[:ER500_27_14],
      log_message: @log_message[:ER500_27_14],
      additional_info: response
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :consumer_empty_found_error}) do
    %{
      log_code: @log_code[:SAER_409_51_11],
      log_message: @log_message[:SAER_409_51_11]
    }
    |> Map.merge(build_exception({:error, :register_not_found}))
  end

  def build_exception({:error, :relation_empty_found}) do
    %{
      log_code: @log_code[:ER409_52_21],
      log_message: @log_message[:ER409_52_21]
    }
    |> Map.merge(build_exception({:error, :not_found_relation}))
  end

  def build_exception({:error, :consumer_not_found}) do
    %{
      log_code: @log_code[:ER409_36_20],
      log_message: @log_message[:ER409_36_20]
    }
    |> Map.merge(build_exception({:error, :inactive_channel}))
  end

  def build_exception({:error, :get_consumer_unknown}) do
    %{
      log_code: @log_code[:SAER_500_04_15],
      log_message: @log_message[:SAER_500_04_15]
    }
    |> Map.merge(build_exception({:error, :unknown_get_consumer}))
  end

  def build_exception({:error, :get_consumer_inactive}) do
    %{
      log_code: @log_code[:ER409_50_02],
      log_message: @log_message[:ER409_50_02]
    }
    |> Map.merge(build_exception({:error, :inactive_channel}))
  end

  def build_exception({:error, :unknown_save_consumer_cache}) do
    %{
      log_code: @log_code[:ER500_27_15],
      log_message: @log_message[:ER500_27_15]
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :redis_write_error, response}) do
    %{
      log_code: @log_code[:ER500_27_16],
      log_message: @log_message[:ER500_27_16],
      additional_info: response
    }
    |> Map.merge(build_exception({:error, :unknown_get_consumer}))
  end

  def build_exception({:error, :error_get_identity_not_register, error}) do
    %{
      log_message: @log_message[:SAER_409_51_12],
      log_code: @log_code[:SAER_409_51_12],
      additional_info: error
    }
    |> Map.merge(build_exception({:error, :consumer_empty_found_error}))
  end

  def build_exception({:error, :consumer_not_found_code_not_register, error}) do
    %{
      log_message: @log_message[:ER409_36_21],
      log_code: @log_code[:ER409_36_21],
      additional_info: error
    }
    |> Map.merge(build_exception({:error, :consumer_not_found}))
  end

  def build_exception({:error, :consumer_empty_not_found}) do
    %{
      log_message: @log_message[:ER409_36_22],
      log_code: @log_code[:ER409_36_22]
    }
    |> Map.merge(build_exception({:error, :consumer_not_found}))
  end

  def build_exception({:error, :suid_server_error_get_alias_identity, response}) do
    %{
      log_message: @log_message[:SAER_500_04_16],
      log_code: @log_code[:SAER_500_04_16],
      additional_info: response
    }
    |> Map.merge(build_exception({:error, :unknown_get_consumer}))
  end

  def build_exception({:error, :client_inactive_status}) do
    %{
      log_message: @log_message[:ER409_50_03],
      log_code: @log_code[:ER409_50_03]
    }
    |> Map.merge(build_exception({:error, :inactive_channel}))
  end

  def build_exception({:error, :consult_role_not_found}) do
    %{
      log_message: @log_message[:ER409_67_03],
      log_code: @log_code[:ER409_67_03]
    }
    |> Map.merge(build_exception({:error, :role_not_found}))
  end

  def build_exception({:error, :role_empty_functionalities}) do
    %{
      log_message: @log_message[:BPER_409_140_03],
      log_code: @log_code[:BPER_409_140_03]
    }
    |> Map.merge(build_exception({:error, :role_without_functionalities}))
  end

  def build_exception({:error, :granular_product_group_gateway_extract_not_found}) do
    %{
      log_message: @log_message[:BPER_409_141_04],
      log_code: @log_code[:BPER_409_141_04]
    }
    |> Map.merge(build_exception({:error, :granular_group_not_exist}))
  end

  def build_exception({:error, :product_group_role_not_exist}) do
    %{
      log_message: @log_message[:BPER_409_92_06],
      log_code: @log_code[:BPER_409_92_06]
    }
    |> Map.merge(build_exception({:error, :product_group_not_exist}))
  end

  def build_exception({:error, :parameter_suid_consumer_empty}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:CONSUMER_NOT_FOUND],
      detail: @detail[:PARAMETER_SUID_CONSUMER_EMPTY]
    }
  end

  def build_exception({:error, :missing_consumer_acronym}) do
    %{
      log_message: @log_message[:ER409_36_06],
      log_code: @log_code[:ER409_36_06]
    }
    |> Map.merge(build_exception({:error, :parameter_suid_consumer_empty}))
  end

  def build_exception({:error, :no_found_parameter}) do
    %{
      status: @status_code[:NOT_FOUND],
      code: @code[:PARAMETER_NO_FOUND],
      detail: @detail[:PARAMETER_NO_FOUND]
    }
  end

  def build_exception({:error, :no_exist_parameter}) do
    %{
      log_message: @log_message[:ER404_16_01],
      log_code: @log_code[:ER404_16_01]
    }
    |> Map.merge(build_exception({:error, :no_found_parameter}))
  end

  def build_exception({:error, :parameter_error}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:PARAMETER_ERROR],
      detail: @detail[:UNKNOWN_ERROR_SERVICE]
    }
  end

  def build_exception({:error, :entitlement_parameters_error}) do
    %{
      log_message: @log_message[:ER500_01_04],
      log_code: @log_code[:ER500_01_04]
    }
    |> Map.merge(build_exception({:error, :parameter_error}))
  end

  # consumer masam
  def build_exception({:error, :empty_message_id_header}) do
    %{
      log_code: @log_code[:ER400_35_110],
      log_message: @log_message[:ER400_35_110]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_consumer_acronym_header}) do
    %{
      log_code: @log_code[:ER400_35_111],
      log_message: @log_message[:ER400_35_111]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :empty_consumer_header}) do
    %{
      log_code: @log_code[:ER400_35_112],
      log_message: @log_message[:ER400_35_112]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :consumer_masam_srvc_204_not_found, error}) do
    %{
      log_message: @log_message[:ER409_36_23],
      log_code: @log_code[:ER409_36_23],
      additional_info: error
    }
    |> Map.merge(build_exception({:error, :consumer_not_found}))
  end

  def build_exception({:error, :consumer_masam_srvc_400_not_found, error}) do
    %{
      log_message: @log_message[:ER409_36_24],
      log_code: @log_code[:ER409_36_24],
      additional_info: error
    }
    |> Map.merge(build_exception({:error, :consumer_not_found}))
  end

  def build_exception({:error, :get_consumer_masam_headers_empty}) do
    %{
      log_code: @log_code[:ER400_01_22],
      log_message: @log_message[:ER400_01_22]
    }
    |> Map.merge(build_exception({:error, :empty_headers}))
  end

  def build_exception({:error, :no_execute_permission}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:NO_EXECUTE_PERMISSION],
      detail: @detail[:NO_EXECUTE_PERMISSION]
    }
  end

  def build_exception({:error, :permission_masam_cache_not_found_nil}) do
    %{
      log_code: @log_code[:ER409_85_91],
      log_message: @log_message[:ER400_85_91]
    }
    |> Map.merge(build_exception({:error, :no_execute_permission}))
  end

  def build_exception({:error, :permission_masam_cache_not_found}) do
    %{
      log_code: @log_code[:ER409_85_92],
      log_message: @log_message[:ER400_85_92]
    }
    |> Map.merge(build_exception({:error, :no_execute_permission}))
  end

  def build_exception({:error, :consumer_masam_cache_error, response}) do
    %{
      log_code: @log_code[:ER500_27_17],
      log_message: @log_message[:ER500_27_17],
      additional_info: response
    }
    |> Map.merge(build_exception({:error, :internal_redis_error}))
  end

  def build_exception({:error, :internal_consumer_error}) do
    %{
      status: @status_code[:INTERNAL_ERROR],
      code: @code[:UNKNOWN_ERROR_CONSUMER_SERVICE],
      detail: @detail[:UNKNOWN_ERROR_CONSUMER_SERVICE]
    }
  end

  def build_exception({:error, :masam_server_service_validate_response_error, response}) do
    %{
      log_code: @log_code[:ER500_10_07],
      log_message: @log_message[:ER500_10_07],
      additional_info: response
    }
    |> Map.merge(build_exception({:error, :internal_consumer_error}))
  end

  def build_exception({:error, :masam_server_consumer_validate_segment_error}) do
    %{
      log_code: @log_code[:ER500_10_08],
      log_message: @log_message[:ER500_10_08]
    }
    |> Map.merge(build_exception({:error, :internal_consumer_error}))
  end

  def build_exception({:error, :consumer_masam_srvc_in_operation_not_found, error}) do
    %{
      log_message: @log_message[:ER409_36_22],
      log_code: @log_code[:ER409_36_22],
      additional_info: error
    }
    |> Map.merge(build_exception({:error, :consumer_not_found}))
  end

  def build_exception({:error, :masam_conflict_error}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:SEGMENT_UPDATE_ERROR],
      detail: @detail[:SEGMENT_UPDATE_ERROR]
    }
  end

  def build_exception({:error, :masam_consumer_validate_data_deffer}) do
    %{
      log_message: @log_message[:ER409_127_07],
      log_code: @log_code[:ER409_127_07]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :masam_consumer_gateway_update_segment_error}) do
    %{
      log_message: @log_message[:ER409_127_08],
      log_code: @log_code[:ER409_127_08]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :masam_consumer_gateway_extract_update_not_found}) do
    %{
      log_message: @log_message[:ER409_127_09],
      log_code: @log_code[:ER409_127_09]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :masam_consumer_gateway_extract_info_nil}) do
    %{
      log_message: @log_message[:ER409_127_10],
      log_code: @log_code[:ER409_127_10]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :masam_save_segment_is_zero_error}) do
    %{
      log_message: @log_message[:ER409_127_11],
      log_code: @log_code[:ER409_127_11]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :masam_consumer_exist_channel_error}) do
    %{
      log_message: @log_message[:ER409_127_12],
      log_code: @log_code[:ER409_127_12]
    }
    |> Map.merge(build_exception({:error, :masam_conflict_error}))
  end

  def build_exception({:error, :not_found_records}) do
    %{
      status: @status_code[:CONFLICT],
      code: @code[:NO_FOUND_RECORDS],
      detail: @detail[:NO_FOUND_RECORDS]
    }
  end

  def build_exception({:error, :registry_consumer_gateway_extract_v3_not_found}) do
    %{
      log_message: @log_message[:BPER409_109_12],
      log_code: @log_code[:BPER409_109_12]
    }
    |> Map.merge(build_exception({:error, :not_found_records}))
  end

  def build_exception({:error, :masam_server_consumer_validate_exist_error}) do
    %{
      log_code: @log_code[:ER500_10_09],
      log_message: @log_message[:ER500_10_09]
    }
    |> Map.merge(build_exception({:error, :internal_consumer_error}))
  end

  def build_exception({:error, :code_parameter_invalid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_259],
      log_message: @log_message[:SAER_400_35_259]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :code_parameter_not_valid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_260],
      log_message: @log_message[:SAER_400_35_260]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :pk_delegate_not_valid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_261],
      log_message: @log_message[:SAER_400_35_261]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :pk_delegate_not_valid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_262],
      log_message: @log_message[:SAER_400_35_262]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :expiration_days_not_positive}) do
    %{
      log_code: @log_code[:SAER_400_35_263],
      log_message: @log_message[:SAER_400_35_263]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :expiration_days_invalid_number}) do
    %{
      log_code: @log_code[:SAER_400_35_264],
      log_message: @log_message[:SAER_400_35_264]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :expiration_days_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_265],
      log_message: @log_message[:SAER_400_35_265]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :delegate_number_not_positive}) do
    %{
      log_code: @log_code[:SAER_400_35_266],
      log_message: @log_message[:SAER_400_35_266]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :delegate_number_exceeds_limit}) do
    %{
      log_code: @log_code[:SAER_400_35_267],
      log_message: @log_message[:SAER_400_35_267]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :delegate_number_invalid}) do
    %{
      log_code: @log_code[:SAER_400_35_268],
      log_message: @log_message[:SAER_400_35_268]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :delegate_number_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_269],
      log_message: @log_message[:SAER_400_35_269]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_group_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_270],
      log_message: @log_message[:SAER_400_35_270]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_group_invalid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_271],
      log_message: @log_message[:SAER_400_35_271]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_group_invalid_type}) do
    %{
      log_code: @log_code[:SAER_400_35_272],
      log_message: @log_message[:SAER_400_35_272]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
  end

  def build_exception({:error, :channel_group_invalid_format}) do
    %{
      log_code: @log_code[:SAER_400_35_273],
      log_message: @log_message[:SAER_400_35_273]
    }
    |> Map.merge(build_exception({:error, :invalid_values}))
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
