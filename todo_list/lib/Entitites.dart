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
}

class ContenidoLista {
  // Atributos privados
  int _idApartado;
  int _idLista;
  String _nombreApartado;
  bool _completado;

  // Constructor
  ContenidoLista({
    required int idApartado,
    required int idLista,
    required String nombreApartado,
    required bool completado,
  })  : _idApartado = idApartado,
        _idLista = idLista,
        _nombreApartado = nombreApartado,
        _completado = completado;

  // Setters
  set setIdApartado(int idApartado) => _idApartado = idApartado;
  set setIdLista(int idLista) => _idLista = idLista;
  set setNombreApartado(String nombreApartado) =>
      _nombreApartado = nombreApartado;
  set setCompletado(bool completado) => _completado = completado;

  // Getters
  int get getIdApartado => _idApartado;
  int get getIdLista => _idLista;
  String get getNombreApartado => _nombreApartado;
  bool get getCompletado => _completado;
}
