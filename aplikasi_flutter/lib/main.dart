import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme
        theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.blueGrey.shade900,
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)),
        title: 'Aplikasi Flutter',
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        });
  }
}
