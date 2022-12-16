import 'package:untitled/core/model/signup_response.dart';

abstract class SignupRepo{
    Future<SignupResponse>insertDataAPI(String name, String emailId, String phoneNumber, String password);
}