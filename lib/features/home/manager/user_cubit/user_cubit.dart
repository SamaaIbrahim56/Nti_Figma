import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_figma/features/home/manager/user_cubit/user_state.dart';

import '../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState>{
  UserCubit() : super(UserInitState());
  static UserCubit get(context) =>BlocProvider.of(context);

  void getUserData({required UserModel user}){
    emit(UserSuccess( userModel: user));
  }

}