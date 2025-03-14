import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/house_badge.dart';

class ViewCharacter extends StatefulWidget {
  final character;
  final characters;
  final int heroTag;
  const ViewCharacter({
    super.key,
    required this.character,
    required this.characters,
    required this.heroTag,
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
                child: Hero(
                  tag: widget.heroTag,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    height: height * 0.45,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.01,
                left: 5,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 25,
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
                    color: Color(0xFF2C3930),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: height * 0.015,
                        left: width * 0.05,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.07,
                        left: width * 0.05,
                        child: Row(
                          children: [
                            Icon(Icons.person_2_rounded, size: 25),
                            SizedBox(width: 5),
                            Text(actor, style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Positioned(
                        top: height * 0.045,
                        right: width * 0.05,
                        child: HouseBadge(house: house),
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
                            color: Colors.white38,
                          ),
                        ),
                      ),

                      Positioned(
                        top: height * 0.14,
                        left: width * 0.05,
                        child: Text(
                          "Personal Information",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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
                                SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: width * 0.1,
                                        child: Icon(Icons.cake_rounded),
                                      ),
                                      SizedBox(
                                        width: width * 0.3,
                                        child: Text(
                                          dob,
                                          style: TextStyle(fontSize: 18),
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
                                        child: Icon(genderIcon),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          gender,
                                          style: TextStyle(fontSize: 18),
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
                                        child: Icon(Icons.accessibility_new),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          chars,
                                          style: TextStyle(fontSize: 18),
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
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.35,
                        left: width * 0.05,
                        child: Text(
                          "Other Characters",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ViewCharacter(
                                            character: currentChar,
                                            characters: widget.characters,
                                            heroTag: index,
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * 0.35,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
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
                                      SizedBox(height: 5),
                                      Text(
                                        otherCharacters[index]['name']
                                                .toString()
                                                .isNotEmpty
                                            ? otherCharacters[index]['name']
                                            : "Unknown",
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        otherCharacters[index]['actor']
                                                .toString()
                                                .isNotEmpty
                                            ? otherCharacters[index]['actor']
                                            : "Unknown",
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
        : Center(child: CircularProgressIndicator.adaptive());
  }
}
