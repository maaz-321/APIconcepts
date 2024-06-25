import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_projects/Models/ytmodel.dart';

class Listdata extends StatefulWidget {
  const Listdata({super.key});

  @override
  State<Listdata> createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  late Future<List<Item>?> listdata;

  Future<List<Item>?> fetchlist() async {
    final response = await http.get(Uri.parse(
        "https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UC_x5XG1OV2P6uZZ5FSM9Ttw&access_token=YOUR_ACCESS_TOKEN&key=YOUR_API_KEY"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final mydata = YoutubeApi.fromJson(data);
      return mydata.items;
    } else {
      throw Exception("Failed to load data");
    }
  }

  @override
  void initState() {
    super.initState();
    listdata = fetchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listdata"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Item>?>(
            future: listdata,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                final items = snapshot.data!;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        color: Colors.brown,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title: ${item.snippet?.title}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            const SizedBox(height: 5),
                            Text("View Count: ${item.statistics?.viewCount}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 5),
                            Text(
                                "Subscriber Count: ${item.statistics?.subscriberCount}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            const SizedBox(height: 5),
                            Text("Video Count: ${item.statistics?.videoCount}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      );
                    });
              }
            }));
  }
}
