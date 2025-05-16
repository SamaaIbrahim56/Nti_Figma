abstract class UpdateProfileState {}

class UpdateProfileInitState extends  UpdateProfileState {}
class UpdateProfileErrorState extends UpdateProfileState {
  String error;
  UpdateProfileErrorState({required this.error});
}
class UpdateProfileLoadingState extends  UpdateProfileState {}
class UpdateProfileSuccessState extends  UpdateProfileState {}
