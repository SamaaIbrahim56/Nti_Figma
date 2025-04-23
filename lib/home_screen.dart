import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_figma/tasks_screen.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/custom_app_bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showTasks = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           CustomAppBar(
             onPlusTap:(){
               setState(() {
                 showTasks = !showTasks;
               });
             },
           ),

            if (!showTasks)...[
              SizedBox(height: 79,),
              Text(" There are no tasks yet, \n Press the button\n To add New Task",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 16  ), textAlign: TextAlign.center,),
            SizedBox(height: 39,),
            SvgPicture.asset("${AppAssets.no_tasks}")] else...[TasksScreen()]
        
        
        
          ],
        ),
      ),
    );
  }
}
