abstract class ChangePasswordState {}

class ChangePasswordInitState extends  ChangePasswordState {}
class ChangePasswordErrorState extends ChangePasswordState {
  String error;
  ChangePasswordErrorState({required this.error});
}
class ChangePasswordLoadingState extends  ChangePasswordState {}
class ChangePasswordSuccessState extends  ChangePasswordState {}
