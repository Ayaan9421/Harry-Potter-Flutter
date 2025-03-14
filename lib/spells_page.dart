import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpellsPage extends StatefulWidget {
  const SpellsPage({super.key});

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  List spells = [];

  @override
  void initState() {
    super.initState();
    fetchSpellData();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  void fetchSpellData() async {
    var url = Uri.https('hp-api.onrender.com', '/api/spells');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        spells = jsonDecode(response.body);
      });
    }
  }
}
