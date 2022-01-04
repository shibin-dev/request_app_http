import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_app_http/providers/symptom_provider.dart';
import 'package:request_app_http/screens/home_screen.dart';
import 'package:request_app_http/screens/symptom_screen.dart';
import 'providers/new_provider.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SymptomProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashBoardScreen(),
      ),
    );
  }
}
