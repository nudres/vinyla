class UserModel {
  UserModel({
    required this.uuid,
    required this.email,
    required this.phone,
  });

  final String uuid;
  final String? email;
  final String? phone;
}
