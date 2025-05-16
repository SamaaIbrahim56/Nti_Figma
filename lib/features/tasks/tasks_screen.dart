import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/add_task/manager/add_task_cubit/add_task_cubit.dart';

import '../../core/translation/translation_key.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/tasks_container.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 54),
          Row(
            children: [
              Text(
                TranslationKeys.tasks.tr,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: AppColors.containerText,
                ),
              ),
              SizedBox(width: 34),
              Container(
                width: 14,
                height: 15,
                decoration: BoxDecoration(
                  color: AppColors.sky,
                  borderRadius: BorderRadius.circular(5),
                ),

                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(
                      color: AppColors.backgroundButtom,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 31),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TasksContainer( ),
              );
            },
            itemCount: 3,
            // itemCount: AddTaskCubit.get(context).tasks.length,
          ),

        ],
      ),
    );
  }
}
