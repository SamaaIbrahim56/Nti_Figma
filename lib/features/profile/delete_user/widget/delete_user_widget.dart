import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/profile/delete_user/manager/delete_user_cubit/delete_user_cubit.dart';

import '../../../../core/translation/translation_key.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/delete_user_cubit/delete_user_state.dart';
class DeleteUserWidget extends StatelessWidget {
  const DeleteUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DeleteUserCubit(),
      child: BlocConsumer<DeleteUserCubit,DeleteUserState>(
        listener: (context,state){
          if(state is DeleteUserSuccessState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
          }
          else if(state is DeleteUserErrorState)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context,state){
          return InkWell(
            child: Container( width: MediaQuery.of(context).size.width*0.88,
              height: MediaQuery.of(context).size.height * 0.077,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    offset: Offset(0, 4),
                    blurRadius: 32,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.person_remove_alt_1_outlined,color: Colors.red[900],),
                  SizedBox(width: 15,),

                  Text(TranslationKeys.DeleteUser.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color:Colors.red[900])        )],
              ),
            ),
            onTap: (){
              DeleteUserCubit.get(context).deleteUser();
            },
          );
        },

      ),
    );
  }
}
