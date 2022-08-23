
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/screens/add_to_list.dart';
import 'package:todo_list/screens/home.dart';

import '../utils/file_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }

  void splash()async{
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //    final dataList = preferences.getStringList('dataList') ?? [];
           final dataList = await FileManager().getList();
    // preferences.setStringList("dataList", value)
    Future.delayed(Duration(seconds: 3),() {
      if(dataList.isEmpty){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> AddToList()), (route) => false);
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx)=> MyHomePage()), (route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28,letterSpacing: .9),),)),
    );
  }
}