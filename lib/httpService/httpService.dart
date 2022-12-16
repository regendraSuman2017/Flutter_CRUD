
import 'package:dio/dio.dart';

abstract class HttpService{
  void init();
  Future<Response>insertDataRequest(String name, String emailId, String phoneNumber, String password);
  Future<Response> fetchDataRequest();
  Future<Response> deleteDataRequest(String id);
  Future<Response> fetchDataUpdateRequest(String id);
  Future<Response> updateDataRequest(id, name, email);
}