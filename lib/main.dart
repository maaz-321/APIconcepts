import 'package:flutter/material.dart';
import 'package:json_projects/screenshowdata.dart/Youtube_satatistic.dart';
import 'package:json_projects/screenshowdata.dart/showdata.dart';
import 'package:json_projects/screenshowdata.dart/showinformation.dart';
import 'package:json_projects/screenshowdata.dart/showphotos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Ytstatistics(),
    );
  }
}
