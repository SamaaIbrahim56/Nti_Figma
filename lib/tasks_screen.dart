import 'package:flutter/material.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/custom_app_bar.dart';
import 'package:nti_figma/utils/elevated%20button.dart';
import 'package:nti_figma/utils/tasks_container.dart';
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 54,),
          Row(
            children: [
              Text("Tasks",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: AppColors.containerText),),
              SizedBox(width: 64,),
              Container(
                width: 14,
                height: 15,
                decoration: BoxDecoration(
                  color: AppColors.sky,
                  borderRadius: BorderRadius.circular(5)
                ),
                
                child: Center(child: Text("5",style: TextStyle(color: AppColors.backgroundButtom,fontSize: 11),)),
              )
            ],
          ),
          SizedBox(height: 31,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(), 
            shrinkWrap: true,
            itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.only(bottom: 20),
             child: TasksContainer(),
           );
         },itemCount: 5,),
          Center(
            child: GreenElevatedButton.create(child: Text("Go To Profile",style: TextStyle(fontSize:19,fontWeight: FontWeight.w300 ),), onPressed: (){
              Navigator.pushNamed(context, "ProfileScreen");
            }),
          )
        ],
      ),
    );
  }
}
