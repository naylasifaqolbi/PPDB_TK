class UserModel {
  final int? id;
  final String email;
  final String phone;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'phone': phone, 'password': password};
  }
}
