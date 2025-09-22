class Usuario {
  final String nombre;
  final String correo;
  final String contra;

  Usuario({required this.nombre, required this.correo, required this.contra});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json['nombre'],
      correo: json['correo'],
      contra: json['contra'],
    );
  }
}
