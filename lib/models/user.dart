class User {
  String token;
  int userId;
  String cedula;

  User({this.token, this.userId, this.cedula});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
    cedula = json['cedula'];
  }
}
