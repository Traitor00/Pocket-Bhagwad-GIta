class Slokas {
  String id;
  int chapter;
  int verse;
  String slok;
  String transliteration;
  Tej tej;
  Siva siva;
  Raman raman;

  Slokas({
    required this.id,
    required this.chapter,
    required this.verse,
    required this.slok,
    required this.transliteration,
    required this.tej,
    required this.siva,
    required this.raman,
  });

  factory Slokas.fromJson(Map<String, dynamic> json) {
    return Slokas(
      id: json['_id'],
      chapter: json['chapter'],
      verse: json['verse'],
      slok: json['slok'],
      transliteration: json['transliteration'],
      tej: Tej.fromJson(json['tej']),
      siva: Siva.fromJson(json['siva']),
      raman: Raman.fromJson(json['raman']),
    );
  }
}

class Raman {
  String author;
  String ht;
  String et;

  Raman({
    required this.author,
    required this.ht,
    required this.et,
  });

  factory Raman.fromJson(Map<String, dynamic> json) {
    return Raman(
      author: json['author'],
      ht: json['ht'],
      et: json['et'],
    );
  }
}

class Tej {
  String author;
  String ht;

  Tej({
    required this.author,
    required this.ht,
  });

  factory Tej.fromJson(Map<String, dynamic> json) {
    return Tej(
      author: json['author'],
      ht: json['ht'],
    );
  }
}

class Siva {
  String author;
  String et;
  String ec;

  Siva({
    required this.author,
    required this.et,
    required this.ec,
  });

  factory Siva.fromJson(Map<String, dynamic> json) {
    return Siva(
      author: json['author'],
      et: json['et'],
      ec: json['ec'],
    );
  }
}
