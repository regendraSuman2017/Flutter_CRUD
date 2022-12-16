import 'package:get/get.dart';
import 'package:untitled/core/repository/signup_repository/signup_repo_impl.dart';
import 'package:untitled/feature/signup/Controller/signupcontrroller.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SignupRepoImpl());
    Get.put(SingupController());
  }
}