import 'package:untitled/core/model/deleteData_response.dart';
import 'package:untitled/core/model/fetchData_response.dart';

abstract class FetchDataRepo{
 Future<List<FetchDataResponse>?> fetchDataAPI();
 Future<DeleteDataResponse> deleteDataAPI(String id);
Future<List<FetchDataResponse>?>fetchDataUpdateAPI(id);
 Future<DeleteDataResponse> updateDataAPI(String id,String name, String email);
}