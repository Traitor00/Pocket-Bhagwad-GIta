import 'package:bhagwadgita/api/chapproviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterDetail extends StatelessWidget {
  final int chapterNumber;
  ChapterDetail({required this.chapterNumber});

  @override
  Widget build(BuildContext context) {
    final chaprovider = Provider.of<ChapterProvider>(context, listen: false);
    //final chapters = provider.chapters;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        iconTheme: IconThemeData(color: Colors.deepOrange),
        title: Text(
          "Chapter $chapterNumber",
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Berkshire",
              color: Colors.deepOrangeAccent),
        ),
      ),
      body: FutureBuilder<void>(
          future: chaprovider.fetchChapterdetail(chapterNumber),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              final chapters = chaprovider.chapterdata;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //decoration: BoxDecoration(color: Colors.amber),
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                      child: Column(
                        children: [
                          Text(
                            chapters!.translation,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                fontFamily: "OpenSans",
                                color: Colors.deepOrange),
                          ),
                          Text("(" + chapters.name + ")",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "OpenSans",
                                  color: Colors.deepOrange)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Meaning:  " + chapters.meaning.en,
                            style:
                                TextStyle(fontSize: 16, fontFamily: "OpenSans"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Summary:  " + chapters.summary.en,
                            style:
                                TextStyle(fontSize: 16, fontFamily: "OpenSans"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Verses:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: chapters.versesCount,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(endIndent: 1),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150,
                              margin: EdgeInsets.only(right: 20),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Verse: " + (index + 1).toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
