import 'package:flutter/material.dart';

class HomePageSearch extends StatelessWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final int selectedIndex;
  const HomePageSearch({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.selectedIndex,
  });

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
          onChanged: onSearchChanged,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText:
                selectedIndex == 0
                    ? "Search Characters..."
                    : "Search Spells...",
            contentPadding: EdgeInsets.symmetric(vertical: 14),
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
