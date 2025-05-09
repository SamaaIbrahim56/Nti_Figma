import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_figma/core/widgets/custom_svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
class ProfileContainer extends StatelessWidget {
  final Text title;
  final Widget svg;
  final VoidCallback onTap;
  const ProfileContainer({super.key, required this.title, required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width*0.88,
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
      child: Row(children: [
        svg,
        SizedBox(width: 15,),
        title,
        Spacer(),
        InkWell(
            onTap:onTap ,
            child: CustomSvg(path: AppAssets.arrow_Up))
      ],),
    );
  }
}
