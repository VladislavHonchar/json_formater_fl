import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModule extends ChangeNotifier{
  void readFile() async{
    try{
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final filePath = directory.path + '/myFile';
    final file = File(filePath);
    await file.writeAsString("hello world");
    bool isExist =  await file.exists();
    String readFile = await file.readAsString();
    print(isExist);
    print(file);
    print(readFile);
    }catch(error){
      print(error);
    }
  }
}


class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModule model;
  const ExampleWidgetModelProvider({super.key, required this.model, required this.child}) : super(notifier: model, child: child);

  final Widget child;

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

 static ExampleWidgetModelProvider? read(BuildContext context){
  final widget = context.getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()?.widget;
  return widget is ExampleWidgetModelProvider ? widget : null;
 }
}