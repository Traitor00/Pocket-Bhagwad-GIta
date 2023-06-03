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
          backgroundColor: Colors.orange[100],
          iconTheme: IconThemeData(color: Colors.deepOrange),
          title: Text(
            "Sloka $verse",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Berkshire",
                color: Colors.deepOrangeAccent),
          ),
        ),
        body: FutureBuilder<void>(
          future: verseprovider.fetchSlokas(chapterNumber, verse),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              final verse = verseprovider.slokas;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                      child: Column(
                        children: [
                          Text(
                            verse?.slok ?? "null",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Berkshire",
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(height: 20),
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Transiteration:",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  fontFamily: "OpenSans",
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            verse?.transliteration ?? "unable to fetch data",
                            style:
                                TextStyle(fontSize: 14, fontFamily: "OpenSans"),
                          ),
                          SizedBox(height: 20),
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Summary:",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  fontFamily: "OpenSans",
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Text(
                            verse?.raman?.et ?? "Unable to fetch Sorry",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "OpenSans",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
