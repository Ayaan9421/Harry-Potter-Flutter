import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:harry_potter/house_badge.dart';
import 'package:harry_potter/view_character.dart';

class HomePageList extends StatelessWidget {
  final List characters;
  HomePageList({super.key, required this.characters});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: characters.length,
        itemBuilder: (context, index) {
          var character = characters[index];
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
                  builder: (_) => ViewCharacter(character: character),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: image,
                      height: 80,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            actor,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HouseBadge(house: house),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
