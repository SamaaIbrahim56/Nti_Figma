import 'package:flutter/material.dart';
import 'package:nti_figma/utils/app border_decoration.dart';
import 'package:nti_figma/utils/app_assets.dart';
import 'package:nti_figma/utils/elevated button.dart';
import 'package:nti_figma/utils/app_colors.dart';
class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}
class _LoginscreenState extends State<Loginscreen> {
  bool PasswordVisible = false;
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController UserController = TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 298,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("${AppAssets.logo}"),fit: BoxFit.fill)
              ),
            ),
            SizedBox(height: 20,),
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
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Username",
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
                          } }
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.0775,
                    child: TextFormField(
                      controller: PasswordController,
                      enabled:true,
                      obscureText: !PasswordVisible,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
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
                  SizedBox(height: 23,),
                  GreenElevatedButton.create(child: Text("Login",style: TextStyle(fontSize: 19)), onPressed:  () {
                    if (formkey.currentState?.validate() == true) {
                      print("Form is valid. Proceed with registration.");
                      Navigator.pushReplacementNamed(context, 'HomeScreen');
                    } else {
                      print("Form is invalid. Please check the errors.");
                    }
                  },),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account?",style: TextStyle(color: Colors.black54,fontSize: 14)),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, 'RegisterScreen');
                        }, child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 14),))
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


