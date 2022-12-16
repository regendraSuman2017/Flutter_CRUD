import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled/core/model/deleteData_response.dart';
import 'package:untitled/core/model/fetchData_response.dart';
import 'package:untitled/core/repository/fetchData_repository/fetchData_repo.dart';
import 'package:untitled/httpService/httpService.dart';
import 'package:untitled/httpService/http_service_impl.dart';

class FetchDataRepoImpl implements FetchDataRepo{
late HttpService _httpService;

FetchDataRepoImpl(){
  _httpService = Get.put(HttpServiceImpl());
  _httpService.init();
}


  Future<List<FetchDataResponse>?>fetchDataAPI()async{

final response = await _httpService.fetchDataRequest();

if(response.statusCode==200)
  {
return fetchDataResponseFromJson(response.toString());
  }

  }
List<FetchDataResponse> fetchDataResponseFromJson(String str) => List<FetchDataResponse>.from(json.decode(str).map((x) => FetchDataResponse.fromJson(x)));

  @override
  Future<DeleteDataResponse> deleteDataAPI(String id) async{
    // TODO: implement deleteDataAPI
  final response = await _httpService.deleteDataRequest(id);
  Map<String, dynamic> ResponseMap = Map.from(jsonDecode(response.data));
  return DeleteDataResponse.fromJson(ResponseMap);

  }

  @override
  Future<List<FetchDataResponse>?> fetchDataUpdateAPI(id) async{
    // TODO: implement fetchDataUpdateAPI
    final response  = await _httpService.fetchDataUpdateRequest(id);
    if(response.statusCode==200){
      return fetchUpdateDataResponseFromJson(response.toString());
    }
  }
List<FetchDataResponse> fetchUpdateDataResponseFromJson(String str) => List<FetchDataResponse>.from(json.decode(str).map((x) => FetchDataResponse.fromJson(x)));

  @override
  Future<DeleteDataResponse> updateDataAPI(String id, String name, String email) async{
    // TODO: implement updateDataAPI
   final response = await _httpService.updateDataRequest(id, name,email);
   Map<String,dynamic> ResponseMap = Map.from(jsonDecode(response.data));
   return DeleteDataResponse.fromJson(ResponseMap);
  }



}