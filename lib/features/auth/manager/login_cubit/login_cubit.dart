import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_figma/features/auth/manager/login_cubit/login_state.dart';
import 'package:nti_figma/features/home/data/models/user_model.dart';

import '../../data/repo/auth.dart';


class LoginCubit extends Cubit<LoginState> {
  AuthRepo authRepo = AuthRepo();

  String? error;
  bool passwordVisible= false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  Future<void> onLoginPressed() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var result = await authRepo.login(username: userController.text, password: passwordController.text);
      result.fold(
              (String error)
          {
            emit(LoginErrorState(error));
          },
              (userModel)
          {


            emit(LoginSuccessState(userModel));
          });
    }

  }
  void changePasswordVisibility()
  {
    passwordVisible = !passwordVisible;
    emit(LoginPasswordState());
  }
}
