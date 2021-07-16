import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooalin/controllers/login_controller.dart';
import 'package:gooalin/views/register.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController =
        Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: 100,
            left: 15,
            right: 15,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: loginController.loginFormKey,
              child: Column(
                children: [
                  Center(child: Text('Login', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),),
                  SizedBox(height: 20,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: loginController.email,
                    onSaved: (value){
                      loginController.email.text=value!;
                    },
                    validator: (value){
                      return loginController.validateEmail(value!);
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    controller: loginController.password,
                    onSaved: (value){
                      loginController.password.text=value!;
                    },
                    validator: (value){
                      return loginController.validatePassword(value!);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      loginController.loginCheck();
                    },
                    child: Text('Login'),),
                  SizedBox(height: 5,),
                  TextButton(
                    onPressed: (){
                      Get.to(()=> Register());
                    },
                    child: Text('No account! Register'),
                  ),
                  SizedBox(height: 20,
                    child: Text('OR'),
                  ),
                  GestureDetector(
                    onTap: (){
                      loginController.googleLogIn();
                    },
                    child: Image(image: AssetImage('assets/g1.png',),
                      height: 50,
                    ),
                  ),

                ],
              ),),
          ),
        ),
      ),
    );
  }
}
