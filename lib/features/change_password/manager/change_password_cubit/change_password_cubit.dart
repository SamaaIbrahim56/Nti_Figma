


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/features/change_password/data/change_password_repo/change_password_repo_imple.dart';
import 'package:nti_figma/features/change_password/manager/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitState());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);


  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

ChangePasswordRepoImple changePasswordRepoImple =ChangePasswordRepoImple();
  void savePressed()async {
    if(!formKey.currentState!.validate()) return;
    emit(ChangePasswordLoadingState());
    var result = await changePasswordRepoImple.changePassword(oldPassword: oldPassword.text, confirmNewPassword: confirmPassword.text, newPassword: newPassword.text);
    result.fold(
            (error){emit(ChangePasswordErrorState(error: error));},
            (message){emit(ChangePasswordSuccessState());}
    );

  }


}

























