import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_one/provider/signup_provider.dart';
import 'package:task_one/view/splash_screen.dart';
import 'provider/login_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: Builder(builder: (context) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen());
      }),
    );
  }
}
