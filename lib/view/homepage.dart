import 'package:bhagwadgita/api/chapproviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = ["1.jpg", "2.jpg", "3.jpg"];
  @override
  void initState() {
    super.initState();
    Provider.of<ChapterProvider>(context, listen: false).fetchChapter();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChapterProvider>(context);
    final chapters = provider.chapters;
    String intro =
        "Gita, is a 701-verse Hindu scripture that is part of the epic Mahabharata, It is considered to be one of the main holy scriptures for Hinduism. ";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange[100],
          title: const Text(
            "Bhagwad Gita",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Berkshire",
                color: Colors.deepOrangeAccent),
          ),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 8 / 3,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                padding: const EdgeInsets.all(15),
                child: Text(
                  intro,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "OpenSans"),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Chapters:",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    color: Colors.deepOrangeAccent),
              ),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                return ListTile(
                  splashColor: Colors.amber[400], //will watch latter
                  hoverColor: Colors.amber[400],
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 233, 164, 60)),
                      borderRadius: BorderRadius.circular(20)),

                  onTap: () {},
                  tileColor: Colors.orange[100],
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      chapter.chapterNumber.toString() +
                          "." +
                          chapter.transliteration,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Berkshire",
                          color: Colors.deepOrange[700]),
                    ),
                  ),
                  subtitle: Text(
                    chapter.meaning.en,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 2,
                );
              },
            )),
          ],
        ));
  }
}
