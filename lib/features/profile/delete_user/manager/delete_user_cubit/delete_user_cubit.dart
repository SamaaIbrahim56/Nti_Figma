
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_figma/features/profile/delete_user/data/delete_user_repo/delete_user_repo_imple.dart';

import 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitState());
  static DeleteUserCubit get(context) => BlocProvider.of(context);


DeleteUserRepoImple deleteUserRepoImple =DeleteUserRepoImple();
void deleteUser()async{
  emit(DeleteUserLoadingState());
  var result = await deleteUserRepoImple.deleteUser();
  result.fold(
          (error){emit(DeleteUserErrorState(error: error));},
          (message){emit(DeleteUserSuccessState());}
  );

}






}

























