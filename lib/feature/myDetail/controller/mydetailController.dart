
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/model/fetchData_response.dart';
import 'package:untitled/core/repository/fetchData_repository/fetchData_repo.dart';
import 'package:untitled/core/repository/fetchData_repository/fetchData_repo_impl.dart';

class MyDetailController extends GetxController{

  late FetchDataRepo _fetchDataRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  MyDetailController(){
    _fetchDataRepo  = Get.find<FetchDataRepoImpl>();
  }

  RxList<FetchDataResponse> fetchDataList = <FetchDataResponse>[].obs;

RxBool loader = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  fetchData()async{
    loader.value = true;
    final response = await _fetchDataRepo.fetchDataAPI();
    if(response!=null){
      loader.value= false;
      fetchDataList.value = response;
    }
  }
  deleteDataAPI(String id) async{
    final response = await _fetchDataRepo.deleteDataAPI(id);
    if(response!=null) {
      if (response.response == 1) {
        Get.defaultDialog(
            title: "Deleted",
            content: const Center(child: Text("Your data has been Deleted!"),)
        ).then((value) {
          fetchData();
        });
      }
    }
  }


  fetchDataUpdate(String id)async{
    final response = await _fetchDataRepo.fetchDataUpdateAPI(id);

    if(response!=null){
      var id = response[0].id.toString();
      nameController.text = response[0].name.toString();
      emailController.text = response[0].emailId.toString();

      return  Get.defaultDialog(
          title: "Update My Data",
          content: Container(
          child : Form(
          child: Column(
          children: [

    TextFormField(
    controller: nameController,
    ),
    TextFormField(
    controller: emailController,
    ),
            ElevatedButton(onPressed: ()async{

              final response = await _fetchDataRepo.updateDataAPI(id,nameController.text,emailController.text);
              if(response!=null){
                Get.back();
                Future.delayed(const Duration(seconds: 1));

                Get.defaultDialog(title: "Updated", content: Text("Data Updated")).then((value) {
                  fetchData();
                });
              }

            }, child: Text("Update"))
    ],
    ),
    )
    ));
    }


  }
}