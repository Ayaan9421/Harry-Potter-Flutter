import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Added for Poppins font

class ViewCharacter extends StatefulWidget {
  final character;
  final characters;
  const ViewCharacter({
    super.key,
    required this.character,
    required this.characters,
  });

  @override
  State<ViewCharacter> createState() => _ViewCharacterState();
}

class _ViewCharacterState extends State<ViewCharacter> {
  @override
  Widget build(BuildContext context) {
    var name = widget.character['name'];
    var actor =
        widget.character['actor'].toString().isNotEmpty
            ? widget.character['actor']
            : "Unknown";
    var image =
        widget.character['image'].toString().isNotEmpty
            ? widget.character['image']
            : "https://scontent.fbom10-2.fna.fbcdn.net/v/t39.30808-6/448689422_1020181989476001_7574556243792104140_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=gs_CSo8SIOQQ7kNvgFUW9mb&_nc_oc=AdjJykhBsRF2604y1To3p29PojKcr9xQMnlnwGYFEfH6IiVAXHdNzMO2GtzWiObGqEc&_nc_zt=23&_nc_ht=scontent.fbom10-2.fna&_nc_gid=ART_qqg8C-nwJVtsqs8vZgN&oh=00_AYGTk4MOXKmBooiglmHJNJzjfKkRQ8caJf0CVJfck5P5og&oe=67D75DC8";
    var house =
        widget.character['house'].toString().isNotEmpty
            ? widget.character['house']!
            : "Unknown";
    var gender =
        widget.character['gender'].toString().isNotEmpty
            ? widget.character['gender'].toString()[0].toUpperCase() +
                widget.character['gender'].toString().substring(1)
            : "Unknown";

    var genderIcon = gender == 'Male' ? Icons.male : Icons.female;
    var dob =
        widget.character['dateOfBirth'].toString() != 'null'
            ? widget.character['dateOfBirth'].toString()
            : "Unknown";
    var eyes =
        widget.character['eyeColour'].toString().isNotEmpty
            ? widget.character['eyeColour'].toString()[0].toUpperCase() +
                widget.character['eyeColour'].toString().substring(1)
            : "Unknown";
    var hair =
        widget.character['hairColour'].toString().isNotEmpty
            ? widget.character['hairColour'].toString()[0].toUpperCase() +
                widget.character['hairColour'].toString().substring(1)
            : "Unknown";
    var species =
        widget.character['species'].toString().isNotEmpty
            ? widget.character['species'].toString()[0].toUpperCase() +
                widget.character['species'].toString().substring(1)
            : "Unknown";

    var chars = '$species - $eyes Eyes - $hair Hairs';
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return widget.character.isNotEmpty
        ? Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: height * 0.45,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: height * 0.01,
                left: 15,
                child: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.9),
                        Colors.green.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
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
                  child: Stack(
                    children: [
                      Positioned(
                        top: height * 0.015,
                        left: width * 0.05,
                        child: Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
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
                      Positioned(
                        top: height * 0.075,
                        left: width * 0.05,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_2_rounded,
                              size: 25,
                              color: Colors.yellowAccent,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              actor,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.07,
                        right: width * 0.05,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.yellowAccent.withValues(alpha: 0.5),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            house,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.115,
                        child: SizedBox(
                          height: 15,
                          width: width * 0.95,
                          child: Divider(
                            height: 10,
                            thickness: 2,
                            indent: width * 0.05,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.14,
                        left: width * 0.05,
                        child: Text(
                          "Personal Information",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.12,
                        child: SizedBox(
                          width: width,
                          height: height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width * 0.1,
                                        child: const Icon(
                                          Icons.cake_rounded,
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.3,
                                        child: Text(
                                          dob,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width * 0.1,
                                        child: Icon(
                                          genderIcon,
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          gender,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width * 0.1,
                                        child: const Icon(
                                          Icons.accessibility_new,
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          chars,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.32,
                        child: SizedBox(
                          height: 15,
                          width: width * 0.95,
                          child: Divider(
                            height: 10,
                            thickness: 2,
                            indent: width * 0.05,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.35,
                        left: width * 0.05,
                        child: Text(
                          "Other Characters",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.4,
                        left: width * 0.01,
                        child: SizedBox(
                          height: 150,
                          width: width * 0.98,
                          child: ListView.builder(
                            itemCount: 20,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var otherCharacters =
                                  widget.characters
                                      .where((c) => c != widget.character)
                                      .toList();
                              var currentChar = otherCharacters[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ViewCharacter(
                                            character: currentChar,
                                            characters: widget.characters,
                                          ),
                                    ),
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: width * 0.35,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.yellowAccent
                                                  .withValues(alpha: 0.5),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.green.withValues(
                                                  alpha: 0.3,
                                                ),
                                                blurRadius: 5,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                otherCharacters[index]['image']
                                                        .toString()
                                                        .isNotEmpty
                                                    ? otherCharacters[index]['image']
                                                    : 'https://scontent.fbom10-2.fna.fbcdn.net/v/t39.30808-6/448689422_1020181989476001_7574556243792104140_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=gs_CSo8SIOQQ7kNvgFUW9mb&_nc_oc=AdjJykhBsRF2604y1To3p29PojKcr9xQMnlnwGYFEfH6IiVAXHdNzMO2GtzWiObGqEc&_nc_zt=23&_nc_ht=scontent.fbom10-2.fna&_nc_gid=ART_qqg8C-nwJVtsqs8vZgN&oh=00_AYGTk4MOXKmBooiglmHJNJzjfKkRQ8caJf0CVJfck5P5og&oe=67D75DC8',
                                            height: 90,
                                            width: 90,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        otherCharacters[index]['name']
                                                .toString()
                                                .isNotEmpty
                                            ? otherCharacters[index]['name']
                                            : "Unknown",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        otherCharacters[index]['actor']
                                                .toString()
                                                .isNotEmpty
                                            ? otherCharacters[index]['actor']
                                            : "Unknown",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        : const Center(child: CircularProgressIndicator.adaptive());
  }
}
