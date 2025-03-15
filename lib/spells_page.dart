import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_background/animated_background.dart';
import 'package:http/http.dart' as http;

class SpellsPage extends StatefulWidget {
  final String searchQuery;
  const SpellsPage({super.key, required this.searchQuery});

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> with TickerProviderStateMixin {
  List spells = [];
  List filteredSpells = [];
  @override
  void initState() {
    super.initState();
    fetchSpellData();
  }

  @override
  void didUpdateWidget(covariant SpellsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      filterSpells();
    }
  }

  void filterSpells() {
    setState(() {
      if (widget.searchQuery.isEmpty) {
        filteredSpells = List.from(spells);
      } else {
        filteredSpells =
            spells
                .where(
                  (spell) => spell['name'].toString().toLowerCase().contains(
                    widget.searchQuery.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: Colors.greenAccent,
            spawnMinSpeed: 10,
            spawnMaxSpeed: 30,
            particleCount: 20,
          ),
        ),
        vsync: this,
        child: ListView.builder(
          itemCount: filteredSpells.length,
          itemBuilder: (context, index) {
            var spell = filteredSpells[index];
            var spellName = spell['name'];
            return InkWell(
              onTap: () => showSpellModal(context, spell, index),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: height * 0.07,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Hero(
                          tag: 'spell-$index',
                          child: Text(
                            spellName,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.greenAccent.withValues(
                                    alpha: 0.5,
                                  ),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.auto_fix_high,
                          size: 26,
                          color: Colors.yellowAccent,
                          shadows: [
                            Shadow(
                              color: Colors.green.withValues(alpha: 0.5),
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showSpellModal(
    BuildContext context,
    Map<String, dynamic> spell,
    int index,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withValues(alpha: 0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_fix_high, color: Colors.white, size: 30),
                    const SizedBox(width: 10),
                    Hero(
                      tag: 'spell-$index',
                      child: Text(
                        spell['name']!,
                        style: TextStyle(
                          fontFamily: 'HarryPotter',
                          fontSize: 40,
                          color: Colors.yellowAccent,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: Text(
                    spell['description']!,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void fetchSpellData() async {
    var url = Uri.https('hp-api.onrender.com', '/api/spells');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        spells = jsonDecode(response.body);
        filteredSpells = List.from(spells);
      });
      filterSpells();
    }
  }
}
