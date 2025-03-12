import 'package:flutter/material.dart';

class HomePageSearch extends StatelessWidget {
  const HomePageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          color: Colors.black.withValues(alpha: 0.3),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText: "Search Characters, Spells...",
            contentPadding: EdgeInsets.symmetric(vertical: 14),
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
