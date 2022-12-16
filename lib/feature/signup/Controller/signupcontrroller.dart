
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled/core/globals.dart' as globals;
import 'package:untitled/core/repository/signup_repository/signup_repo.dart';
import 'package:untitled/core/repository/signup_repository/signup_repo_impl.dart';

class SingupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

late SignupRepo _signupRepo;

  SingupController(){
    _signupRepo = Get.find<SignupRepoImpl>();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    print(globals.autoLogin.value);
    super.onInit();
  }

  insertDataAPI(String name, String emailId, String phoneNumber, String password)async{

    final response = await  _signupRepo.insertDataAPI(name, emailId,phoneNumber, password);
    if(response!=null){

      if(response.response=="1"){

        return Get.defaultDialog(
          title: "Success",
          content: Text("Your data inserted!")
        );

      }
    }
  }

}


