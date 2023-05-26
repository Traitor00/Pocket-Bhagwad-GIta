import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bhagwadgita/modal/chapters.dart';
import 'package:flutter/material.dart';

class ChapterProvider extends ChangeNotifier {
  List<Chapter> chapters = [];
  Future<void> fetchChapter() async {
    try {
      final url = "https://bhagavadgitaapi.in/chapters/";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> chapterDta = json.decode(response.body);
        chapters = chapterDta.map((data) => Chapter.fromJson(data)).toList();
        notifyListeners();
      }
    } catch (error) {
      print("Unable to fetch chapters");
    }
  }
}
