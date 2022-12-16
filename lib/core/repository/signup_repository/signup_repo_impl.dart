
import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled/core/model/signup_response.dart';
import 'package:untitled/core/repository/signup_repository/signup_repo.dart';
import 'package:untitled/httpService/httpService.dart';
import 'package:untitled/httpService/http_service_impl.dart';

class SignupRepoImpl implements SignupRepo{
  late HttpService _httpService;

  SignupRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }


  @override
  Future<SignupResponse> insertDataAPI(String name, String emailId, String phoneNumber, String password) async{
    // TODO: implement insertDataAPI

final response = await _httpService.insertDataRequest(name, emailId, phoneNumber, password);
Map<String,dynamic> ResponseMap =Map.from(jsonDecode(response.data));
return SignupResponse.fromJson(ResponseMap);
  }
}