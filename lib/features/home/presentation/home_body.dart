import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nti_figma/features/add_task/manager/add_task_cubit/add_task_cubit.dart';
import 'package:nti_figma/features/tasks/tasks_screen.dart';
import '../../../core/translation/translation_key.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_svg.dart';
import '../../../core/widgets/floatingaction_button.dart';
import '../../add_task/manager/add_task_cubit/add_task_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                onTap: () {
                  Navigator.pushNamed(context, "ProfileScreen");
                },
              ),
              BlocBuilder<AddTaskCubit, AddTaskState>(
                builder:  (context, state) {
                  return  AddTaskCubit.get(context).tasks.isEmpty
                      ? Column(
                    children: [
                      SizedBox(height: 79),

                      Text(
                        TranslationKeys.noTasks.tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 39),
                      CustomSvg(path: AppAssets.no_tasks),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                    ],
                  )
                      : TasksScreen();
                },
      
              ),


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonGreen(
        onTap: () {
          Navigator.pushNamed(context, "AddTask");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
