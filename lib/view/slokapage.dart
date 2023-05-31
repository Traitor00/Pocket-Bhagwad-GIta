import 'package:bhagwadgita/api/verseprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlokaPage extends StatelessWidget {
  final int chapterNumber;
  final int verse;
  SlokaPage({required this.chapterNumber, required this.verse});

  @override
  Widget build(BuildContext context) {
    final verseprovider = Provider.of<VerseProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sloka $verse"),
      ),
      body: Center(child: Text("Sloka $verse of chapter $chapterNumber")),
    );
  }
}
