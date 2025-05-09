import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/features/auth/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState>{
 RegisterCubit():super(RegisterInitState());
 static RegisterCubit get(context) => BlocProvider.of(context);
 String? error;
 XFile? image;

 bool isPasswordVisible = false;
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController userController = TextEditingController();
 final TextEditingController confirmPasswordController = TextEditingController();

 GlobalKey<FormState>formKey=GlobalKey<FormState>();

 void onRegisterPressed(){
   if (formKey.currentState?.validate() == true) {
       error =null;
   } else {
     error="Form is invalid. Please check the errors.";
   }

   if (error==null){
     emit(RegisterSuccessState());
   }else{
     emit(RegisterErrorState(error!));
   }
 }
 void changePasswordVisibility(){
   isPasswordVisible = !isPasswordVisible;
   emit(RegisterChangePasswordState());
 }

}