import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:vinyla/domain/domain.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._useCase)
      : super(
          const ProfileInitial(
            profileModel: null,
          ),
        );

  final GetProfileUseCase _useCase;

  void tryGetProfile() async {
    try {
      _getProfile();
    } on BaseException catch (e) {
      emit(FailureProfileState(e.type, e.message, profileModel: state.profileModel));
    }
  }

  void _getProfile() async {
    final model = await _useCase.execute();
    emit(IdleProfileState(profileModel: model));
  }
}
