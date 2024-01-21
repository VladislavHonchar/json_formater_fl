import 'package:flutter/material.dart';
import 'package:json_formater_fl/shared_references/example/example_widget.dart';
//import 'package:json_formater_fl/http_request/domain/widgets/example/example.dart';
//import 'package:json_formater_fl/json_formatter/json_formater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ExampleWidget(),
        //body: ExampleWidget(),
        //body: ExampleHttpRequest(),
        //body: Example(),
      )
    );
  }
}



