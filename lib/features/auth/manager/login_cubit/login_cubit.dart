import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_figma/features/auth/manager/login_cubit/login_state.dart';
import 'package:nti_figma/features/home/data/models/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  String? error;
  bool passwordVisible= false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  void onLoginPressed() {
    if (formKey.currentState?.validate() == true) {
      error = null;
    } else {
      error = "Form is invalid. Please check the errors.";
    }
    if (error == null) {
      UserModel userModel=UserModel(userName: userController.text);
      emit(LoginSuccessState(userModel));
    } else {
      emit(LoginErrorState(error!));
    }
  }

  void changePasswordVisibility()
  {
    passwordVisible = !passwordVisible;
    emit(LoginPasswordState());
  }
}
