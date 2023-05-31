import 'dart:convert';

import 'package:bhagwadgita/modal/verses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerseProvider extends ChangeNotifier {
  Slokas? _slokas;
  Slokas? get slokas => _slokas;
  Future<void> fetchSlokas(int chapterNumber, int verse) async {
    try {
      final url = "https://bhagavadgitaapi.in/slok/$chapterNumber/$verse/";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        _slokas = Slokas.fromJson(jsonData);
        notifyListeners();
      }
    } catch (error) {
      print("Unable to fetch data");
    }
  }
}
