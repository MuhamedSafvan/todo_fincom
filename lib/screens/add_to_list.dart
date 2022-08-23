import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/utils/file_manager.dart';
import '../utils/utils.dart';

class AddToList extends StatefulWidget {
  const AddToList({Key? key}) : super(key: key);

  @override
  State<AddToList> createState() => _AddToListState();
}

class _AddToListState extends State<AddToList> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
final phoneController = TextEditingController();
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                editField(
                  controller: emailController,
                  label: "Email",
                  inputType: TextInputType.emailAddress
                ),
                SizedBox(height: 10,),
                editField(
                  controller: phoneController,
                  label: "Mobile number",
                                inputType: TextInputType.phone,
                                inputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ]
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    await FileManager().addToList(context, emailController.text, phoneController.text);
                  }
                }, child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}