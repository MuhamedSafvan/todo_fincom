import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/data_model.dart';
import 'package:todo_list/screens/home.dart';
import 'package:todo_list/utils/utils.dart';

class FileManager {
  Future<List<DataModel>> getList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final dataList = preferences.getStringList('dataList') ?? [];
    List<DataModel> datas = [];
    dataList.forEach((element) {
      datas.add(DataModel(
          email: element.split(",").first.trim(),
          phone: element.split(",").last.trim()));
    });
    return datas;
  }

  Future addToList(context, String email, String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final dataList = preferences.getStringList('dataList') ?? [];
    final stringList = email + "," + phone;
    var toAdd = [];
    if (dataList.isNotEmpty) {
      if(dataList.any((element) => element.split(",").first== email)){
          showMessage("Email already exists", Colors.red, context);
      }else if(dataList.any((element) => element.split(",").last==phone)){
          showMessage("Mobile already exists", Colors.red, context);
      }else{
        dataList.add(stringList);
        preferences.setStringList('dataList', dataList);
      showMessage("Data added successfully", Colors.green, context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => MyHomePage()), (route) => false);
      }
    } else {
      dataList.add(stringList);
      preferences.setStringList('dataList', dataList);
      showMessage("Data added successfully", Colors.green, context);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (ctx) => MyHomePage()), (route) => false);
    }
  }
}
