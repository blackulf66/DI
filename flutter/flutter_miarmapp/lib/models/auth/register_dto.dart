class RegisterDto {
  RegisterDto({
    required this.email,
    required this.password,
    required this.perfilProvado,
    required this.nick,

  });
  late final String email;
  late final String password;
  late final String perfilProvado;
  late final String nick;


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['perfilProvado'] = perfilProvado;
    _data['nick'] = nick;
    return _data;
  }
}