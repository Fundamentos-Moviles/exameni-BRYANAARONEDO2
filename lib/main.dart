import 'package:flutter/material.dart';
import 'package:buscaminas/buscaminas.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca-Minas-Examen-Bryan-Aaron-Reyes-Hernandez',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BuscaMinas(),
    );
  }
}
