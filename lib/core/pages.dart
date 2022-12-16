import 'package:get/get.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/myDetail/binding/my_detail_binding.dart';
import 'package:untitled/feature/myDetail/view/my_detail_view.dart';
import 'package:untitled/feature/signup/binding/signupbinding.dart';
import 'package:untitled/feature/signup/view/Sign_up.dart';

List<GetPage> allpage=[
  GetPage(
      name: Routes.signup,
      page: ()=> SignupPage(),
    binding: SignupBinding()
  ),

  GetPage(
      name: Routes.myDetailPage,
      page: ()=> MyDetailPage(),
      binding: MyDetailBinding()
  ),
  
];