import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_figma/core/utils/app_assets.dart';
import 'package:nti_figma/core/utils/app_colors.dart';
class FloatingActionButtonGreen extends StatelessWidget {
  const FloatingActionButtonGreen({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onTap,
      shape: const CircleBorder(),
      elevation: 4,
      backgroundColor:AppColors.backgroundButtom,
    child: SvgPicture.asset(AppAssets.floatingactionbutton,width: 100,height: 100,fit: BoxFit.fill,),
    );
  }
}
