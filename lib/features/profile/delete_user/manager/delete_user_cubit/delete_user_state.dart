abstract class DeleteUserState {}

class  DeleteUserInitState extends  DeleteUserState {}
class  DeleteUserErrorState extends DeleteUserState {
  String error;
  DeleteUserErrorState({required this.error});
}
class  DeleteUserLoadingState extends  DeleteUserState {}
class  DeleteUserSuccessState extends  DeleteUserState {}
