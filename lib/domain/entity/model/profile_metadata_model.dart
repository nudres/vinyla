class ProfileMetadataModel {
  ProfileMetadataModel({
    this.dateOfCreation,
    this.dateOfLastVisit,
    this.email,
    this.phone,
    this.isOnline,
  });

  final String? email;
  final String? phone;
  final String? dateOfCreation;
  final String? dateOfLastVisit;
  final bool? isOnline;
}
