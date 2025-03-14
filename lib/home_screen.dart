import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:harry_potter/characters_page.dart';
import 'package:harry_potter/home_page_app_bar.dart';
import 'package:harry_potter/home_page_search.dart';
import 'package:harry_potter/spells_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 12,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.lightGreen,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            padding: EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(icon: FontAwesomeIcons.hatWizard, text: "Characters"),
              GButton(icon: FontAwesomeIcons.wandMagicSparkles, text: "Spells"),
            ],
          ),
        ),
      ),
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
                _selectedIndex == 0 ? CharactersPage() : SpellsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
