import 'package:evaluacion/firebase_options.dart';
import 'package:evaluacion/pages/AcercaDe.dart';
import 'package:evaluacion/pages/Registrar.dart';
import 'package:evaluacion/views/edit_productos.dart';
import 'package:evaluacion/views/login_page.dart';
import 'package:evaluacion/views/sign_up_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:evaluacion/pages/home.dart';
import 'package:evaluacion/pages/Consulta.dart';





void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((_){
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(209, 215,50, 254)),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: {
        "/home": (context) =>  home(),
        //"/add":(context) => const AddStudents(),
        //"/edit":(context) => const EditStudents(),
        "/login":(context) => const LoginPage(),
        "/signup":(context) => const SignUpPage(),
      },

      home: home(),
    );
  }
}