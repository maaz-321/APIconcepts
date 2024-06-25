import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_projects/Models/photosmodel.dart';

class Showphotos extends StatefulWidget {
  const Showphotos({super.key});

  @override
  State<Showphotos> createState() => _ShowphotosState();
}

class _ShowphotosState extends State<Showphotos> {
  List<Photosmodel> lst = [];
  Future getphotosapi() async {
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lst.add(Photosmodel.fromJson(i));
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
        title: Text("Photos"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getphotosapi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  child: Image.asset("${lst[index].url}"),
                );
              });
            }
          }),
    );
  }
}
