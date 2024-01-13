import 'dart:convert';
import 'package:assignment/model/charging_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<ChargingModel> chargingModel = [];

  @override
  void initState() {
    super.initState();
    fetchDat();
  }

  Future<List<ChargingModel>> fetchDat() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (Map<String, dynamic> index in data) {
        chargingModel.add(ChargingModel.fromJson(index));
      } 
      return chargingModel;
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: chargingModel != null
            ? ListView.builder(
                itemCount: chargingModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chargingModel[index].evseName),
                    //subtitle: Text(data[index]['description']),
                    // Add more widgets based on your data structure
                  );
                },
              )
            : CircularProgressIndicator(), // Show a loading indicator while fetching data
      ),
    );
  }
}
