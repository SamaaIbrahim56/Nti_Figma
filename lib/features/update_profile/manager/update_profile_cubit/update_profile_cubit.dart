
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_figma/features/update_profile/manager/update_profile_cubit/update_profile_state.dart';

import '../../data/repo/update_profile_repo_imple.dart';



class ProfileCubit extends Cubit<UpdateProfileState> {
  ProfileCubit() : super(UpdateProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);


  TextEditingController userName = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

XFile? image;
UpdateRepoImple updateRepoImple=UpdateRepoImple();
  void UpdatePressed()async {
    if(!formKey.currentState!.validate()) return;
    emit(UpdateProfileLoadingState());
    var result = await updateRepoImple.updateProfile(userName: userName.text, image: image);
    result.fold(
            (error){emit(UpdateProfileErrorState(error: error));},
            (message){emit(UpdateProfileSuccessState());}
    );

  }


}

























