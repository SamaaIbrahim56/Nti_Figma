import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:nti_figma/features/add_task/data/models/task_model.dart';

import '../utils/app_colors.dart';

class TasksContainer extends StatelessWidget {

  const TasksContainer({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(
               "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.grey,
                ),
              ),
              Column(
                children: [
                  Text(
                    "11/03/2025 05:00 PM".split(" ").first,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    "11/03/2025 05:00 PM".split(" ")[1],
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: AppColors.containerText,
            ),
          ),
        ],
      ),
    );
  }
}
