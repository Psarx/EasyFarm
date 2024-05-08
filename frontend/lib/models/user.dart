import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email; // Change 'username' to 'email'
  final String password;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email, // Change 'username' to 'email'
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email, // Change 'username' to 'email'
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '', // Change 'username' to 'email'
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
