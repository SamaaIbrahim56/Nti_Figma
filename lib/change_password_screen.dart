import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_figma/utils/app%20border_decoration.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/elevated%20button.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController NewPasswordController = TextEditingController();
  final TextEditingController OldPasswordController = TextEditingController();
  final TextEditingController ConfirmPasswordController = TextEditingController();

  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3669,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("${AppAssets.logo}"
                ),
                fit: BoxFit.fill),),),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.0775,
                    child: TextFormField(
                        controller:OldPasswordController,
                        enabled:true,
                        decoration: InputDecoration(
                            hintText: "Old Password",
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
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.0775,

                    child: TextFormField(
                      controller: NewPasswordController,
                      enabled:true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "New Password",
                          hintStyle: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          enabledBorder: AppBorderDecoration.enabledBorder,
                          disabledBorder: AppBorderDecoration.disabledBorder,
                          focusedBorder:AppBorderDecoration.enabledBorder,
                          errorBorder: AppBorderDecoration.errorBorder
                      ),
                      validator: (String? value)
                      {
                        if (value == null || value.isEmpty){
                          return "field is Required";
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Password must contain at least one lowercase letter';
                        }
                        if (!RegExp(r'\d').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        }
                        if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                          return 'Password must contain at least one special character';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.0775,

                    child: TextFormField(
                      controller: ConfirmPasswordController,
                      enabled:true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                          enabledBorder: AppBorderDecoration.enabledBorder,
                          disabledBorder: AppBorderDecoration.disabledBorder,
                          focusedBorder:AppBorderDecoration.enabledBorder,
                          errorBorder: AppBorderDecoration.errorBorder
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Field is required";
                        }
                        if (value != NewPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  GreenElevatedButton.create(child:  Text("Save",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w300)), onPressed: () {
                  },),









                ],
              ),
            )

          ],
        ),
      ),


      );

  }
}
