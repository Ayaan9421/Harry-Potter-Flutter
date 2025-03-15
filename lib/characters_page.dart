import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harry_potter/view_character.dart';
import 'package:http/http.dart' as http;

class CharactersPage extends StatefulWidget {
  final String searchQuery;
  const CharactersPage({super.key, required this.searchQuery});
  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  List characters = [];
  List filteredCharacters = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchCharacterData();
  }

  @override
  void didUpdateWidget(covariant CharactersPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery) {
      filterCharacters();
    }
  }

  void filterCharacters() {
    if (widget.searchQuery.isEmpty) {
      setState(() {
        filteredCharacters = List.from(characters);
      });
    } else {
      setState(() {
        filteredCharacters =
            characters
                .where(
                  (character) => character['name']
                      .toString()
                      .toLowerCase()
                      .contains(widget.searchQuery.toLowerCase()),
                )
                .toList();
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: filteredCharacters.length,
        itemBuilder: (context, index) {
          var character = filteredCharacters[index];
          var name = character['name'];
          var actor =
              character['actor'].toString().isNotEmpty
                  ? character['actor']
                  : "Unknown";
          var image =
              character['image'].toString().isNotEmpty
                  ? character['image']
                  : "https://scontent.fbom10-2.fna.fbcdn.net/v/t39.30808-6/448689422_1020181989476001_7574556243792104140_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=gs_CSo8SIOQQ7kNvgFUW9mb&_nc_oc=AdjJykhBsRF2604y1To3p29PojKcr9xQMnlnwGYFEfH6IiVAXHdNzMO2GtzWiObGqEc&_nc_zt=23&_nc_ht=scontent.fbom10-2.fna&_nc_gid=ART_qqg8C-nwJVtsqs8vZgN&oh=00_AYGTk4MOXKmBooiglmHJNJzjfKkRQ8caJf0CVJfck5P5og&oe=67D75DC8";
          var house =
              character['house'].toString().isNotEmpty
                  ? character['house']
                  : "Unknown";

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => ViewCharacter(
                        character: character,
                        characters: characters,
                      ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 80,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
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
                          Text(
                            actor,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _getHouseColor(house).withValues(alpha: 0.5),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        house,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: _getHouseColor(house),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getHouseColor(String house) {
    switch (house.toLowerCase()) {
      case 'gryffindor':
        return Colors.red;
      case 'slytherin':
        return Colors.green;
      case 'hufflepuff':
        return Colors.yellow;
      case 'ravenclaw':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }

  void fetchCharacterData() async {
    var url = Uri.https('hp-api.onrender.com', '/api/characters');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        characters = jsonDecode(response.body);
        filteredCharacters = List.from(characters);
      });
      filterCharacters();
    }
  }
}
