import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/app_colors.dart';
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  bool isEnglish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("${AppAssets.arrow_back}")),
          SizedBox( width: MediaQuery.of(context).size.width * 0.36,
          ),
                Text("Settings",style:TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: AppColors.containerText),)
              ],
            ),
            SizedBox(height:70 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: AppColors.containerText),),
                Container(
                  width: 102,
                  height: 36,
                  decoration: BoxDecoration(
                    color:AppColors.switchColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEnglish = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isEnglish ? Colors.transparent : AppColors.backgroundButtom,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                            ),
                            alignment: Alignment.center,
                            child: Text('AR', style: TextStyle(color: isEnglish ? AppColors.containerText : Colors.white,
                                fontWeight: FontWeight.w300, fontSize: 20
                            ),
                            ),
                          ),
                        ),
                      ),
                      // English
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEnglish = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isEnglish ? AppColors.backgroundButtom: Colors.transparent,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
                            ),
                            alignment: Alignment.center,
                            child: Text('EN', style: TextStyle(color: isEnglish ? Colors.white : AppColors.containerText,
                              fontWeight: FontWeight.w300, fontSize: 20,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),

      ]
        ),
      ),
    );
  }
}
