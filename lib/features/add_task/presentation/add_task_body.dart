import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/add_task/data/repo/addtask_repo.dart';
import 'package:nti_figma/features/add_task/manager/add_task_cubit/add_task_cubit.dart';
import 'package:nti_figma/features/add_task/manager/add_task_cubit/add_task_state.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/app border_decoration.dart';
import '../../../core/widgets/custom_svg.dart';
import '../../../core/widgets/elevated button.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit,AddTaskState>(
      builder: (context, state) {
        return Form(
          key: AddTaskCubit.get(context).formKey,
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomSvg(path: AppAssets.arrow_back),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.34),
                    Text(
                      TranslationKeys.addTask.tr,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: AppColors.containerText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 46),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 261,
                      height: 207,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.logo),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 29),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.0775,
                  child: TextFormField(
                    enabled: true,
                    controller: AddTaskCubit.get(context).titleController,
                    decoration: InputDecoration(
                      hintText: TranslationKeys.title.tr,
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: AppBorderDecoration.enabledBorder,
                      disabledBorder: AppBorderDecoration.disabledBorder,
                      focusedBorder: AppBorderDecoration.enabledBorder,
                      errorBorder: AppBorderDecoration.errorBorder,
                      focusedErrorBorder:
                      AppBorderDecoration.errorBorder,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return TranslationKeys.fieldRequired.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 17),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.0775,
                  child: TextFormField(
                    enabled: true,
                    controller:
                        AddTaskCubit.get(context).descriptionController,

                    decoration: InputDecoration(
                      hintText: TranslationKeys.description.tr,
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: AppBorderDecoration.enabledBorder,
                      disabledBorder: AppBorderDecoration.disabledBorder,
                      focusedBorder: AppBorderDecoration.enabledBorder,
                      errorBorder: AppBorderDecoration.errorBorder,
                      focusedErrorBorder:
                      AppBorderDecoration.errorBorder,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return TranslationKeys.fieldRequired.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 17),

                GreenElevatedButton.create(
                  child: Text(
                    TranslationKeys.addTask.tr,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  onPressed: () {
                    AddTaskCubit.get(context).onAddTaskPressed();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
