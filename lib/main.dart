import 'package:agenda_contatos/src/screens/main_screen.dart';
import 'package:flutter/material.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts Agenda",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
