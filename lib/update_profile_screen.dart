import 'package:flutter/material.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/elevated%20button.dart';

import 'utils/app border_decoration.dart';
import 'utils/app_colors.dart';
class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController UserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("${AppAssets.logo}"),
          SizedBox(height: 23,),
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.0775,
                  child: TextFormField(
                      controller: UserController,
                      enabled:true,
                      decoration: InputDecoration(
                          hintText: "Username",
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
                SizedBox(height: 27,),
                GreenElevatedButton.create(child: Text("Update",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 19),), onPressed: (){})
              ],
            ),
          ),

        ],
      ),
    );
  }
}
