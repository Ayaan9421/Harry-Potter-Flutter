import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/house_badge.dart';

class ViewCharacter extends StatefulWidget {
  final Map<String, dynamic> character;
  const ViewCharacter({super.key, required this.character});

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

    var chars = species + ' - ' + eyes + ' Eyes - ' + hair + ' Hairs';
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
                  alignment: Alignment.center,
                  height: height * 0.45,
                  width: width,
                  fit: BoxFit.fitWidth,
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
                        child: Container(
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
                        child: Container(
                          width: width,
                          height: height * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
