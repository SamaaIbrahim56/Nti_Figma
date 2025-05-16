import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/features/auth/manager/register_cubit/register_state.dart';

import '../../data/repo/auth.dart';

class RegisterCubit extends Cubit<RegisterState>{
 RegisterCubit():super(RegisterInitState());
 static RegisterCubit get(context) => BlocProvider.of(context);
 String? error;
 XFile? image;
 AuthRepo authRepo = AuthRepo();

 bool isPasswordVisible = false;
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController userController = TextEditingController();
 final TextEditingController confirmPasswordController = TextEditingController();

 GlobalKey<FormState>formKey=GlobalKey<FormState>();

 void onRegisterPressed()async
 {
 if(formKey.currentState!.validate())
 {
 emit(RegisterLoadingState());
 var result = await authRepo.register(username: userController.text, password: passwordController.text, image: image);
 result.fold(
 (String error) // left
     {
 emit(RegisterErrorState(error));
 },
 (r) // right
     {
 emit(RegisterSuccessState());
 });
 }

 }
 void changePasswordVisibility(){
   isPasswordVisible = !isPasswordVisible;
   emit(RegisterChangePasswordState());
 }

}