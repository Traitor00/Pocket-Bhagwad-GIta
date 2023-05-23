class Chapter {
  int chapterNumber;
  int versesCount;
  String name;
  String translation;
  String transliteration;
  Meaning meaning;
  Summary summary;

  Chapter({
    required this.chapterNumber,
    required this.versesCount,
    required this.name,
    required this.translation,
    required this.transliteration,
    required this.meaning,
    required this.summary,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      chapterNumber: json['chapter_number'],
      versesCount: json['verses_count'],
      name: json['name'],
      translation: json['translation'],
      transliteration: json['transliteration'],
      meaning: Meaning.fromJson(json['meaning']),
      summary: Summary.fromJson(json['summary']),
    );
  }
}

class Meaning {
  String en;
  String hi;

  Meaning({
    required this.en,
    required this.hi,
  });

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      en: json['en'],
      hi: json['hi'],
    );
  }
}

class Summary {
  String en;
  String hi;

  Summary({
    required this.en,
    required this.hi,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      en: json['en'],
      hi: json['hi'],
    );
  }
}
