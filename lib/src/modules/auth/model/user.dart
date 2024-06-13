import 'dart:convert';
import 'dart:io';

class User {
  int? id;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  File? image;
  User({
    this.id,
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
    this.image,
  });

  User copyWith({
    int? id,
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    File? image,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'userName': userName,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] != null ? map['id'] as int : null,
        userName: map['userName'] != null ? map['userName'] as String : null,
        email: map['email'] != null ? map['email'] as String : null,
        password: map['password'] != null ? map['password'] as String : null);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, email: $email, password: $password, file ${image?.path})';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userName == userName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ userName.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
