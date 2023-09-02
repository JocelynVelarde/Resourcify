import 'package:flutter/material.dart';
import 'package:flutter_application_1/onboarding.dart';
import 'widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WidgetTree(),
      debugShowCheckedModeBanner: false,
    );
  }
}

















