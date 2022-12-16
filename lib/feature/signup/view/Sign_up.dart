import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/signup/Controller/signupcontrroller.dart';

class SignupPage extends GetView<SingupController>{
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: const Text("Signup"),
  ),
  body: Center(
    child: Container(
      height: 300,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           TextFormField(
             decoration: const  InputDecoration(
               border: OutlineInputBorder(),
               hintText: "Enter Name"
             ),
             controller: controller.nameController,
           ),
           TextFormField(
               decoration: const  InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Enter Email ID"),
             controller: controller.emailController,
           ),
           TextFormField(
               decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Enter Phone Number"
               ),
             controller: controller.phoneController,
           ),
           TextFormField(
               decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: "Enter Password"
               ),
             controller: controller.passwordController,
           ),

           ElevatedButton(
               onPressed: (){
                 controller.insertDataAPI(controller.nameController.text,
                 controller.emailController.text, controller.phoneController.text,controller.passwordController.text
                 );
               }, child: const Text("Save")),


           ElevatedButton(onPressed: ()
           {
             Get.toNamed(Routes.myDetailPage);
           }, child: Text("Fetch Data"))

         ],
      ),
    ),
  ),

);
  }


}