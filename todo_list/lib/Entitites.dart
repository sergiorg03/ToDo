class Usuario {
  // Atributos privados
  String _email;
  String _nombre;
  String _apellidos;
  String _telf;
  String _contra;

  // Constructor
  Usuario({
    required String email,
    required String nombre,
    required String apellidos,
    required String telf,
    required String contra,
  })  : _email = email,
        _nombre = nombre,
        _apellidos = apellidos,
        _telf = telf,
        _contra = contra;

  // Setters
  set setEmail(String email) => _email = email;
  set setNombre(String nombre) => _nombre = nombre;
  set setApellidos(String apellidos) => _apellidos = apellidos;
  set setTelf(String telf) => _telf = telf;
  set setContra(String contra) => _contra = contra;

  // Getters
  String get getEmail => _email;
  String get getNombre => _nombre;
  String get getApellidos => _apellidos;
  String get getTelf => _telf;
  String get getContra => _contra;

  Map<String, dynamic> toMap() {
    return {
      'email': _email,
      'nombre': _nombre,
      'apellidos': _apellidos,
      'telf': _telf,
      'contra': _contra
    };
  }
}

class Lista {
  // Atributos privados
  int _idLista;
  String _nombreLista;
  String _descripcion;
  bool _activa;
  DateTime _fechaCreacion;
  DateTime _fechaUltimaActualizacion;
  String _emailUsuario;
  bool _completada;

  // Constructor
  Lista({
    required int idLista,
    required String nombreLista,
    required String descripcion,
    required bool activa,
    required DateTime fechaCreacion,
    required DateTime fechaUltimaActualizacion,
    required String emailUsuario,
    required bool completada,
  })  : _idLista = idLista,
        _nombreLista = nombreLista,
        _descripcion = descripcion,
        _activa = activa,
        _fechaCreacion = fechaCreacion,
        _fechaUltimaActualizacion = fechaUltimaActualizacion,
        _emailUsuario = emailUsuario,
        _completada = completada;

  // Setters
  set setIdLista(int idLista) => _idLista = idLista;
  set setNombreLista(String nombreLista) => _nombreLista = nombreLista;
  set setDescripcion(String descripcion) => _descripcion = descripcion;
  set setActiva(bool activa) => _activa = activa;
  set setFechaCreacion(DateTime fechaCreacion) =>
      _fechaCreacion = fechaCreacion;
  set setFechaUltimaActualizacion(DateTime fechaUltimaActualizacion) =>
      _fechaUltimaActualizacion = fechaUltimaActualizacion;
  set setEmailUsuario(String emailUsuario) => _emailUsuario = emailUsuario;
  set setCompletada(bool completada) => _completada = completada;

  // Getters
  int get getIdLista => _idLista;
  String get getNombreLista => _nombreLista;
  String get getDescripcion => _descripcion;
  bool get getActiva => _activa;
  DateTime get getFechaCreacion => _fechaCreacion;
  DateTime get getFechaUltimaActualizacion => _fechaUltimaActualizacion;
  String get getEmailUsuario => _emailUsuario;
  bool get getCompletada => _completada;

  Map<String, dynamic> toMap() {
    return {
      'id': _idLista,
      'emailUsuario': _emailUsuario,
      'nombreLista': _nombreLista,
      'descripcion': _descripcion,
      'activa': _activa,
      'fechaCreacion': _fechaCreacion.toIso8601String(),
      'fechaUltimaActualizacion': _fechaUltimaActualizacion.toIso8601String(),
      'completada': _completada
    };
  }
}

class ContenidoLista {
  int _idApartado;
  int _idLista;
  String _emailUsuario;
  String _nombreApartado;
  bool _completado;
  String _notas;
  DateTime _fechaCreacion;
  DateTime _fechaUltimaActualizacion;

  ContenidoLista({
    required int idApartado,
    required int idLista,
    required String emailUsuario,
    required String nombreApartado,
    required bool completado,
    required String notas,
    required DateTime fechaCreacion,
    required DateTime fechaUltimaActualizacion,
  })  : _idApartado = idApartado,
        _idLista = idLista,
        _emailUsuario = emailUsuario,
        _nombreApartado = nombreApartado,
        _completado = completado,
        _notas = notas,
        _fechaCreacion = fechaCreacion,
        _fechaUltimaActualizacion = fechaUltimaActualizacion;

  // Constructor para crear un objeto ContenidoLista desde un mapa.
  ContenidoLista.fromMap(Map<String, dynamic> map)
      : _idApartado = map['idApartado'],
        _idLista = map['idLista'],
        _emailUsuario = map['emailUsuario'],
        _nombreApartado = map['nombreApartado'],
        _completado = map['completado'],
        _notas = map['notas'],
        _fechaCreacion = DateTime.parse(map['fechaCreacion']),
        _fechaUltimaActualizacion =
            DateTime.parse(map['fechaUltimaActualizacion']);

  // Método para convertir el objeto ContenidoLista a un mapa.
  Map<String, dynamic> toMap() {
    return {
      'idApartado': _idApartado,
      'idLista': _idLista,
      'emailUsuario': _emailUsuario,
      'nombreApartado': _nombreApartado,
      'completado': _completado,
      'notas': _notas,
      'fechaCreacion': _fechaCreacion.toIso8601String(),
      'fechaUltimaActualizacion': _fechaUltimaActualizacion.toIso8601String(),
    };
  }
}
