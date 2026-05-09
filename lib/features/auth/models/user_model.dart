class UserModel {
  final String email;
  final String password;
  final String name;
  final List<dynamic> fav;

  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.fav,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password, 'name': name, 'fav': fav};
  }
}