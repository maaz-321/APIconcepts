import "dart:convert";

import "package:flutter/material.dart";
import "package:json_projects/Models/components.dart";
import 'package:http/http.dart' as http;

class ShowInfo extends StatefulWidget {
  const ShowInfo({super.key});

  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  List<Information> lst = [];

  Future<List<Information>> fetchinfo() async {
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lst.add(Information.fromJson(i));
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
          title: Text("FETCH"),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fetchinfo(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: lst.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: (BoxDecoration(
                              border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("NAME:${lst[index].name}"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Email:${lst[index].email}")
                            ],
                          ),
                        ),
                      );
                      ;
                    });
              }
            }));
  }
}
