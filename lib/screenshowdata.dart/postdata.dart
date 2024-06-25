import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:json_projects/Models/Postmodel.dart';

class PostDATA extends StatefulWidget {
  const PostDATA({super.key});

  @override
  State<PostDATA> createState() => _PostDATAState();
}

class _PostDATAState extends State<PostDATA> {
  TextEditingController namecontrollar = TextEditingController();
  TextEditingController jobcontrollar = TextEditingController();

  PostDATA? _persons;
  Future postdata(String name, String job) async {
    var postmodel;
    http.Response response =
        await http.post(Uri.parse("https://reqres.in/api/users?page=2"), body: {
      "name": name,
      "job": job,
    });
    var jsondata = jsonDecode(response.body);
    postmodel = Postmodel.fromJson(jsondata);
    return postmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post-Data",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [

          _persons==null? CircularProgressIndicator():Text("${namecontrollar}"),


          TextField(
            controller: namecontrollar,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          TextField(
            controller: jobcontrollar,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                final n = namecontrollar.text;
                final j = namecontrollar.text;

                PostDATA persons = await postdata(n, j);

                setState(() {
                  _persons = persons;
                });
              },
              child: Text(
                "Post It",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
