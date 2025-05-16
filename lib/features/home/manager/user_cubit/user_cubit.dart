import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_state.dart';

import '../../data/home_repo/home_repo.dart';
import '../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState>
{
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  HomeRepo repo = HomeRepo();
  void getUserData({required UserModel user})
  {
    emit(UserGetSuccess(userModel: user));
  }
  Future<bool> getUserDataFromAPI()async
  {
    var response =await repo.getUserData();

    return response.fold((error)
    {
      emit(UserGetError(error: error));
      return false;
    }, (userModel)
    {
      emit(UserGetSuccess(userModel: userModel));
      return true;
    });
  }

}