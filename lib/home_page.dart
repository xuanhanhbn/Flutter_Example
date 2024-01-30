import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_example/model/place_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<PlaceModel> allPlaceList = [];

  @override
  void initState() {
    super.initState();
    getAllPlace();
  }

  Future<void> getAllPlace() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:8080/api/v1/getAll"));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        allPlaceList = PlaceModel.listFromJson(responseData);
        setState(() {});
      } else {
        print('Failed to get place list. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, bottom: 150.0),
                          child: Text(
                            "Hi Guy",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 160.0,
                    left: 16.0,
                    right: 16.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Tìm kiếm",
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 100,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Column(
                          children: [
                            Image.asset(
                              'images/hotel.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Hotels',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            Image.asset(
                              'images/fly.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Flights',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            Image.asset(
                              'images/hotelFly.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'All',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.count(
                      padding: EdgeInsets.all(10),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: allPlaceList.map((place) {
                        return Container(
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Display your data here, for example:
                              Text(place.placeName ?? "name"),
                              Image.network(place.urlImage ?? "urlImage"),
                              Text("Rate: ${place.starRating ?? 0}"),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
