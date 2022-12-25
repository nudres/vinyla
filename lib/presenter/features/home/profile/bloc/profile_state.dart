part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {
  final ProfileModel? profileModel;

  const ProfileState({this.profileModel});

  String get fullName => profileModel?.fullName ?? "";

  String get bio => profileModel?.bio ?? "";

  String get email => profileModel?.metadata?.email ?? "";

  String get dateOfCreation => profileModel?.metadata?.dateOfCreation ?? "";

  String get dateOfLastVisit => profileModel?.metadata?.dateOfLastVisit ?? "";

  bool get isOnline => profileModel?.metadata?.isOnline ?? false;
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({
    required ProfileModel? profileModel,
  }) : super(profileModel: profileModel);
}

class LoadingProfileState extends ProfileState {
  const LoadingProfileState({
    required ProfileModel? profileModel,
  }) : super(profileModel: profileModel);
}

class IdleProfileState extends ProfileState {
  const IdleProfileState({
    required ProfileModel? profileModel,
  }) : super(profileModel: profileModel);
}

class FailureProfileState extends ProfileState {
  const FailureProfileState(
    this.type,
    this.message, {
    required ProfileModel? profileModel,
  }) : super(profileModel: profileModel);

  final BaseExceptionType? type;
  final String? message;
}
