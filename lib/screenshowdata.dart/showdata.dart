import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_projects/Models/array_object.dart';
import 'package:http/http.dart' as http;

class Shown extends StatefulWidget {
  const Shown({super.key});

  @override
  State<Shown> createState() => _ShownState();
}

class _ShownState extends State<Shown> {
  List<Userdata> lst = [];
  Future<List<Userdata>> getdata() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lst.add(Userdata.fromJson(i));
      }
      return lst;
    } else {
      return lst;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feching data from api"),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: lst.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 120,
                          width: 300,
                          color: Colors.purple[400],
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text("TITLE:${lst[index].title}"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("USER ID:${lst[index].userId}"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("ID:${lst[index].id}")
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }
          }),
    );
  }
}
