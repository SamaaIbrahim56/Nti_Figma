import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onPlusTap});
  final VoidCallback? onPlusTap;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("${AppAssets.logo}") ,
          ),
          SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello!",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 12 ),),
              SizedBox(height: 4,),
              Text("Sama Ibrahim",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 16  ),),

            ],

          ),
          Spacer(),
          InkWell(child: SvgPicture.asset("${AppAssets.Plus}"),
          onTap: onPlusTap,
          )

        ],
      ),
    );
  }
}
