import 'package:flutter/material.dart';
import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( //tambahkan router untuk navigasi
      title: 'Anime Verse',
      theme: ThemeData(
        fontFamily: 'Urbanist',
      ),
      routerConfig: createRouter(), //gunakan createRouter untuk konfigurasi router
      debugShowCheckedModeBanner: false,
    );
  }
}
