import 'package:flutter/material.dart';
import 'package:hacker_kernel_task/screen/authentication/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/homescreen/home_screen.dart';

String? token;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("token");
  print("TOKEN == $token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
      initialRoute: (token == null || token!.isEmpty) ? "login" : "/",
      routes: {
        '/': (context) => HomeScreen(),
        'login': (context) => LoginScreen(),
      },
    );
  }
}
