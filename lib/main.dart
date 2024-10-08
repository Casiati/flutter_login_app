import 'package:default_login_screen/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AuthModel(), child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
        hintColor: Colors.purpleAccent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.purple[900], fontSize: 18),
          bodyMedium: TextStyle(color: Colors.purple[800], fontSize: 16),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}