import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_assets.dart';
import 'app_colors.dart';
class ProfileContainer extends StatelessWidget {
  final Text title;
  final SvgPicture svg;
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
            child: SvgPicture.asset("${AppAssets.arrow_Up}"))
      ],),
    );
  }
}
