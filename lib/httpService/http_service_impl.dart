

import 'package:dio/dio.dart';
import 'package:untitled/core/url_constant.dart';
import 'package:untitled/httpService/httpService.dart';

class HttpServiceImpl implements HttpService{
 late Dio _dio;

  @override
  void init() {
    // TODO: implement init
    _dio = Dio(BaseOptions(baseUrl: URLConstant.baseUrl));
  }

  @override
  Future<Response> insertDataRequest(String name, String emailId, String phoneNumber, String password) async{
    // TODO: implement insertDataRequest
    Response response;

try{
  response = await _dio.get("");
} on DioError catch(e){
throw Exception(e.message);
}
return response;
  }

  @override
  Future<Response> fetchDataRequest()async{
    Response response;
try{
  response = await _dio.get(""); // Write API Here
} on DioError catch(e){
  print(e.message);
throw Exception(e.message);
}
return response;
  }


  @override
  Future<Response> deleteDataRequest(String id) async{
    Response response;
    // TODO: implement deleteDataRequest
    try{
      response = await _dio.get(""); //Write API here
    }on DioError catch(e){
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> fetchDataUpdateRequest(String id) async{
    // TODO: implement fetchDataUpdateRequest
    Response response;
    try{
      response = await _dio.get("updateDataFlutterIntern?id=$id");
    }on DioError catch(e){
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> updateDataRequest(id, name, email)async {
    Response response;
    try {
      response = await _dio.get("updateDataFlutterIntern2?id=$id&name=$name&emailId=$email");
    } on DioError catch (e) {
      throw Exception(e.message);
    }

    return response;
  }
}