import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/feature/myDetail/controller/mydetailController.dart';

class MyDetailPage extends GetView<MyDetailController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    appBar: AppBar(
      title: const Text("My Detail Page"),
    ),

    body: Obx(()=> controller.loader.value==true ? Center(child : CircularProgressIndicator())
        : Center(
      child: DataTable(
        border: TableBorder.all(
          color: Colors.black,
            width: 2
        ),
        columns: [
          DataColumn(label: Text('id')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('EmailId')),
          DataColumn(label: Text('Delete')),
          DataColumn(label: Text('Update')),
        ],

        rows: controller.fetchDataList.map((fetchData) {
          return DataRow(
              cells: [
                DataCell(Text(fetchData.id.toString()),),
                DataCell(Text(fetchData.name.toString()),),
                DataCell(Text(fetchData.emailId.toString()),),

                DataCell(
                    InkWell(
                      child : Icon(Icons.delete,color: Colors.red,),
                      onTap: (){
                        controller.deleteDataAPI(fetchData.id.toString());
                },)),

                DataCell(
                    InkWell(
                      child : Icon(Icons.mode_edit_outline_outlined,color: Colors.green,),
                      onTap: (){
                        controller.fetchDataUpdate(fetchData.id.toString());

                },))
              ]);
        }).toList(),
      ),
    )),
  );
  }
}