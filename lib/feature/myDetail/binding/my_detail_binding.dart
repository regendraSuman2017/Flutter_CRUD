import 'package:get/get.dart';
import 'package:untitled/core/repository/fetchData_repository/fetchData_repo_impl.dart';
import 'package:untitled/feature/myDetail/controller/mydetailController.dart';

class MyDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(FetchDataRepoImpl());
    Get.put(MyDetailController());
  }

}