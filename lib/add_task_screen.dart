import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_figma/utils/app%20border_decoration.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/elevated%20button.dart';
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(23.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Row(
    children: [
    InkWell(
        onTap: (){Navigator.pop(context);},
        child: SvgPicture.asset("${AppAssets.arrow_back}")),
    SizedBox( width: MediaQuery.of(context).size.width * 0.34,
    ),
    Text("Add Task",style:TextStyle(fontSize: 19,fontWeight: FontWeight.w300,color: AppColors.containerText),)
    ],),
      SizedBox(height: 46,),
      Container(
          width: 261,
          height: 207,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("${AppAssets.logo}")),
            borderRadius: BorderRadius.circular(20)
          ),
      ),
      SizedBox(height: 29,),

      Container(
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.0775,
        child: TextFormField(
            enabled:true,
            decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: AppBorderDecoration.enabledBorder,
                disabledBorder: AppBorderDecoration.disabledBorder,
                focusedBorder:AppBorderDecoration.enabledBorder,
                errorBorder: AppBorderDecoration.errorBorder
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Field is required";
              } }
        ),
      ),
      SizedBox(height: 17,),
      Container(
        width: MediaQuery.of(context).size.width * 0.88,
        height: MediaQuery.of(context).size.height * 0.0775,
        child: TextFormField(
            enabled:true,
            decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: AppBorderDecoration.enabledBorder,
                disabledBorder: AppBorderDecoration.disabledBorder,
                focusedBorder:AppBorderDecoration.enabledBorder,
                errorBorder: AppBorderDecoration.errorBorder
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Field is required";
              } }
        ),
      ),
      SizedBox(height: 30,),

      GreenElevatedButton.create(child: Text("Add Task",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300)), onPressed: (){})
    ],
    ),
    )
    );
  }
}
