import 'package:flutter/material.dart';
import 'package:ward_connect/providers/user_provider.dart';
import 'package:ward_connect/screens/user/home_screen.dart';
import 'package:ward_connect/screens/user/login_screen.dart';
import 'package:ward_connect/screens/user/signup_screen.dart';
import 'package:ward_connect/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyFarm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? LoginScreen()
          : HomeScreen(),
    );
  }
}
