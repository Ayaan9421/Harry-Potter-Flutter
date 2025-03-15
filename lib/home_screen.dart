import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:harry_potter/characters_page.dart';
import 'package:harry_potter/home_page_app_bar.dart';
import 'package:harry_potter/home_page_search.dart';
import 'package:harry_potter/spells_page.dart';
import 'package:animated_background/animated_background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  String _searchQuery = '';

  void onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green.withValues(alpha: 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            gap: 12,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundGradient: LinearGradient(
              colors: [
                Colors.greenAccent.withValues(alpha: 0.7),
                Colors.yellowAccent.withValues(alpha: 0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                _searchQuery = '';
              });
            },
            tabs: const [
              GButton(icon: FontAwesomeIcons.hatWizard, text: "Characters"),
              GButton(icon: FontAwesomeIcons.wandMagicSparkles, text: "Spells"),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.green.withValues(alpha: 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              baseColor: Colors.greenAccent,
              spawnMinSpeed: 10,
              spawnMaxSpeed: 30,
              particleCount: 20,
              spawnOpacity: 0.3,
            ),
          ),
          vsync: this,
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                const HomePageAppBar(),
                HomePageSearch(
                  searchQuery: _searchQuery,
                  onSearchChanged: onSearchChanged,
                  selectedIndex: _selectedIndex,
                ),
                _selectedIndex == 0
                    ? CharactersPage(searchQuery: _searchQuery)
                    : SpellsPage(searchQuery: _searchQuery),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
