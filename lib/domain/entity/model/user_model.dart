class UserModel {
  UserModel({
    required this.uuid,
    required this.email,
    required this.phone,
    required this.dateOfCreation,
    required this.dateOfLastVisit,
  });

  final String uuid;
  final String? email;
  final String? phone;
  final DateTime? dateOfCreation;
  final DateTime? dateOfLastVisit;
}
