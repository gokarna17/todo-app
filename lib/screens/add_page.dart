import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart'as http;

class AddToPage extends StatefulWidget {
  const AddToPage({super.key});

  @override
  State<AddToPage> createState() => _AddToPageState();
}

class _AddToPageState extends State<AddToPage> {
  TextEditingController titleControler=TextEditingController();
  TextEditingController descriptionControler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add todo list"),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children:  [
         TextField(
          controller: titleControler,
          decoration: InputDecoration(hintText: 'title'),
        ),
        SizedBox(height: 30,),
         TextField(
          controller: descriptionControler,
          decoration: InputDecoration(hintText: 'description'),
          minLines: 5,
          maxLines: 8,
        ),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: (){}, child: const Text("add"))
      ]),
    );
  }
  void submitData()async{
    final title=titleControler.text;
    final description=descriptionControler.text;
    final body={
  "title": "title",
  "description": "description",
  "is_completed": false
};
final url="https://api.nstack.in/v1/todos";
final uri=Uri.parse(url);
final response=await http.post(uri,body: jsonEncode(body));
print(response);


  }
}
