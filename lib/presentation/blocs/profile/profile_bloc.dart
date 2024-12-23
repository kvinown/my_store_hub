import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store_hub/domain/entity/user.dart';
import 'package:my_store_hub/domain/usecases/user/get_current_user.dart';
import 'package:my_store_hub/domain/usecases/user/update_current_user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUser getCurrentUser;
  final UpdateCurrentUser updateCurrentUser;

  ProfileBloc({
    required this.getCurrentUser,
    required this.updateCurrentUser,
  }) : super(ProfileInitial()) {
    on<OnFetchProfile>((event, emit) async {
      emit(ProfileLoading());

      final result = await getCurrentUser.execute();

      result.fold(
        (failure) => emit(ProfileFailure(failure.message)),
        (data) => emit(ProfileLoaded(data)),
      );
    });

    on<OnUpdateProfile>((event, emit) async {
      emit(ProfileLoading());

      final result = await updateCurrentUser.execute(event.user, event.image);

      result.fold(
        (failure) => emit(ProfileUpdateFailure(failure.message)),
        (successMessage) => emit(ProfileUpdateSuccess(successMessage)),
      );

      add(OnFetchProfile());
    });
  }
}
