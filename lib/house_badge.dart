import 'package:flutter/material.dart';

class HouseBadge extends StatelessWidget {
  final String house;
  const HouseBadge({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (house) {
      case "Gryffindor":
        color = Colors.red;
        break;
      case "Slytherin":
        color = Colors.green;
        break;
      case "Hufflepuff":
        color = Colors.yellow;
        break;
      case "Ravenclaw":
        color = Colors.blue;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        house,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
