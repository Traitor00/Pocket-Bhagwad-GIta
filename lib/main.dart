import 'dart:io';
import 'package:bhagwadgita/api/chapproviders.dart';
import 'package:bhagwadgita/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//I have included this class because I was debugging in my mobile and was gettting HandshakeException: Handshake error in client (OS Error)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global =
      MyHttpOverrides(); // this line is for same errormentioned above
  runApp(
    ChangeNotifierProvider(
      //you can subscribe to its changes using change notifier
      create: (_) => ChapterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bhagwad GIta',
      home: HomePage(),
    );
  }
}
