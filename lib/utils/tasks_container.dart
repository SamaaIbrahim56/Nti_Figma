import 'package:flutter/material.dart';

import 'app_colors.dart';
class TasksContainer extends StatelessWidget {
  const TasksContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 335,
      height: 90,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.sky,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My First Task",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.grey),),
              Column(
                children: [
                  Text("11/03/2025",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.grey),),
                  Text("05:00 pm",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: AppColors.grey),),
                ],
              ),
            ],
          ),
          Text("Improve my English skills \n by trying to speek",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: AppColors.containerText),),
        ],
      ),
    );
  }
}
