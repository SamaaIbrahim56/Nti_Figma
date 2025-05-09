import 'package:flutter/material.dart';
import 'package:nti_figma/features/add_task/presentation/add_task_body.dart';
class AddTask extends StatelessWidget {
  const AddTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AddTaskBody()
    );
  }
}
