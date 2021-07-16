import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gooalin/controllers/register_controller.dart';
import 'package:gooalin/views/logIn.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController =
        Get.put(RegisterController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: registerController.regFormKey,
              child: Column(
                children: [
                  Center(child: Text('Register', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    controller: registerController.firstName,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    controller: registerController.lastName,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: registerController.email,
                    onSaved: (value){
                      registerController.email.text=value!;
                    },
                    validator: (value){
                      return registerController.validateEmail(value!);
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    controller: registerController.password,
                    onSaved: (value){
                      registerController.password.text=value!;
                    },
                    validator: (value){
                      return registerController.validatePassword(value!);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){
                      registerController.registerCheck();
                    },
                    child: Text('SignUp'),),
                  SizedBox(height: 5,),
                  TextButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: Text('Already have account! LogIn'),
                  ),

                ],
              ),),
          ),
        ),
      ),
    );
  }
}


