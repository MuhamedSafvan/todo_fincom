import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/screens/add_to_list.dart';
import 'package:todo_list/utils/file_manager.dart';
import '../models/data_model.dart';
import '../utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataModel> dataList = [];

  getData()async{
       final datas = await FileManager().getList();
       setState(() {
         dataList = datas;
       });
       print('dataList $dataList');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
          
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Column(      
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (ctx,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(dataList[index].email!,style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: .8),),
                          SizedBox(height: 15,),
                          Text(dataList[index].phone!,style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: .8),),
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { 
                    return Divider();
                   },),
                   SizedBox(height: 20,),
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Text("TODO List",style: TextStyle(fontWeight: FontWeight.w600,letterSpacing: .8),),
                   )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add new",
        onPressed: () {  
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const AddToList()));
      },
      child: Icon(Icons.add,size: 35,)),
    );
  }
}