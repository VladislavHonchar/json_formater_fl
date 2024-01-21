import 'dart:convert';
import 'package:json_formater_fl/json_formatter/example_data.dart';
import 'package:json_formater_fl/json_formatter/human.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: JsonExampleProvider(
            coder: JsonExampleCoder(), child: const ButtonWidget()));
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text("Coding")),
        ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
            child: const Text("Decoding")),
      ]),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;
  const JsonExampleProvider(
      {super.key, required this.coder, required this.child})
      : super(child: child);

  final Widget child;

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  static JsonExampleProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  @override
  bool updateShouldNotify(JsonExampleProvider oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {
    final objects = humans.map((e) => e.toJson()).toList();
    final jsonString = jsonEncode(objects);
    print(jsonString);
  }
  void decode() {
    try {
      final json = jsonDecode(jsonString) as List<dynamic>;
      final humans =
          json.map((e) => Human.fromJson(e as Map<String, dynamic>)).toList();
      print(humans);
    } catch (error) {
      print(error);
    }
  }
}
