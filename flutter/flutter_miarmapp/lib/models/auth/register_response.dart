class RegisterResponse {
  RegisterResponse({
    required this.id,
    required this.avatar,
    required this.nick,
    required this.email,
     this.fecha,
    required this.perfilPrivado,
     this.following,
     this.posts,
  });
  late final String id;
  late final String avatar;
  late final String nick;
  late final String email;
  late final Null fecha;
  late final bool perfilPrivado;
  late final Null following;
  late final Null posts;
  
  RegisterResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    avatar = json['avatar'];
    nick = json['nick'];
    email = json['email'];
    fecha = null;
    perfilPrivado = json['perfilPrivado'];
    following = null;
    posts = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['avatar'] = avatar;
    _data['nick'] = nick;
    _data['email'] = email;
    _data['fecha'] = fecha;
    _data['perfilPrivado'] = perfilPrivado;
    _data['following'] = following;
    _data['posts'] = posts;
    return _data;
  }
}