import 'package:flutter/material.dart';
import 'package:nti_figma/AppBorderDecoration.dart';
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
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 298,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/image.jpg"),fit: BoxFit.fill)
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(23.0),
              child: Column(
                children: [
                  TextFormField(
                      controller: UserController,
                      enabled:true,
                      decoration: InputDecoration(
                          hintText: "Username",
                          labelText: "name",
                          prefixIcon: Icon(Icons.person),
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
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: PasswordController,
                    enabled:true,
                    obscureText: !PasswordVisible,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            PasswordVisible ? Icons.lock_open : Icons.lock,
                          ),onPressed: () {
                          setState(() {
                            PasswordVisible = !PasswordVisible;
                          });
                        },
                        ),
                        prefixIcon: Icon(Icons.key),
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

                  SizedBox(height: 23,),
                  ElevatedButton( onPressed: () {

                    if (formkey.currentState?.validate() == true) {
                      print("Form is valid. Proceed with registration.");
                      Navigator.pushNamed(context, 'RegisterScreen');

                    } else {
                      print("Form is invalid. Please check the errors.");
                    }
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: Size(331, 50),
                      ),
                      child: Text("Login",style: TextStyle(fontSize: 19))),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,                    children: [
                      Text("Don't Have An Account?",style: TextStyle(color: Colors.black54,fontSize: 16)),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, 'RegisterScreen');

                      }, child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 17),))
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


