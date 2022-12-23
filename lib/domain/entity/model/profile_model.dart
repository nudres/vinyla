class ProfileModel {
  ProfileModel({
    required this.login,
    required this.firstName,
    required this.secondName,
    required this.fullName,
    required this.bio,
    required this.dateOfCreation,
    required this.dateOfLastVisit,
    this.email,
  });

  final String login;
  final String firstName;
  final String secondName;
  final String fullName;
  final String bio;
  final String dateOfCreation;
  final String dateOfLastVisit;
  final String? email;

  ProfileModel copyWith({
    String? login,
    String? firstName,
    String? secondName,
    String? fullName,
    String? bio,
    String? dateOfCreation,
    String? dateOfLastVisit,
    String? email,
  }) {
    return ProfileModel(
      login: login ?? this.login,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      fullName: fullName ?? this.fullName,
      bio: bio ?? this.bio,
      dateOfCreation: dateOfCreation ?? this.dateOfCreation,
      dateOfLastVisit: dateOfLastVisit ?? this.dateOfLastVisit,
      email: email ?? this.email,
    );
  }
}
