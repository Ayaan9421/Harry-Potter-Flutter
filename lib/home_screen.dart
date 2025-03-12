import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harry_potter/home_page_app_bar.dart';
import 'package:harry_potter/home_page_list.dart';
import 'package:harry_potter/home_page_search.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('assets/green_bg.jpg', fit: BoxFit.cover),
          ),

          SafeArea(
            top: true,
            child: Column(
              children: [
                HomePageAppBar(),
                HomePageSearch(),
                HomePageList(characters: characters),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchCharacterData() async {
    var url = Uri.https('hp-api.onrender.com', '/api/characters');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        characters = jsonDecode(response.body);
      });
      print(response.body);
    }
  }
}
