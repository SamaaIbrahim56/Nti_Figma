import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/elevated%20button.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              SvgPicture.asset(AppAssets.start),
              SizedBox(height: 60,),
              Text("Welcome To \n Do It!",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24),textAlign: TextAlign.center),
              SizedBox(height: 40,),
              Text("Ready to conquer your tasks? Let's Do \n It together.",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.grey),textAlign: TextAlign.center,),
              SizedBox(height: 68,),
              GreenElevatedButton.create(child: Text("Let's Start",style: TextStyle(fontSize:19,fontWeight: FontWeight.w300 ),), onPressed: (){
                Navigator.pushNamed(context, "RegisterScreen");
              })

            ],
          ),
        ),
      ),
    );
  }
}
