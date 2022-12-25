import 'package:faker/faker.dart';

import '../entity.dart';

class ProfileModel {
  ProfileModel({
    required this.login,
    required this.firstName,
    required this.secondName,
    required this.bio,
    this.metadata,
  });

  final String login;
  final String firstName;
  final String secondName;
  final String bio;
  final ProfileMetadataModel? metadata;

  String get fullName => "$firstName $secondName";

  ProfileModel copyWith({
    String? login,
    String? firstName,
    String? secondName,
    String? fullName,
    String? bio,
    ProfileMetadataModel? metadata,
  }) {
    return ProfileModel(
      login: login ?? this.login,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      bio: bio ?? this.bio,
      metadata: metadata ?? this.metadata,
    );
  }
}
