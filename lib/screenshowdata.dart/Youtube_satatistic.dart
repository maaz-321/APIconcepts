import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_projects/Models/ytmodel.dart';

class Ytstatistics extends StatefulWidget {
  const Ytstatistics({super.key});

  @override
  State<Ytstatistics> createState() => _YtstatisticsState();
}

class _YtstatisticsState extends State<Ytstatistics> {
  late Future<PageInfo?> pageInfoFuture;

  Future<PageInfo?> fetchPageInfo() async {
    final response = await http.get(Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UC_x5XG1OV2P6uZZ5FSM9Ttw&access_token=AIzaSyCR078vSUoITHNG6h3LG5OtC0CxlC2msDQ&key=AIzaSyCR078vSUoITHNG6h3LG5OtC0CxlC2msDQ"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final mydata = YoutubeApi.fromJson(data);
      return mydata.pageInfo;
    } else {
      throw Exception('Failed to load page info');
    }
  }

  @override
  void initState() {
    super.initState();
    pageInfoFuture = fetchPageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Statistics"),
        centerTitle: true,
      ),
      body: FutureBuilder<PageInfo?>(
        future: pageInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final pageInfo = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Results: ${pageInfo.totalResults}'),
                  Text('Results Per Page: ${pageInfo.resultsPerPage}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
