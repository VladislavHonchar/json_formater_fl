import 'package:flutter/material.dart';
import 'package:json_formater_fl/file_directory/example/example_module.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final _model = ExampleWidgetModule();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ExampleWidgetModelProvider(
          model: _model, 
        child: Column(
          children: [
            const _ReadFileButton(),
          ],
          )
        ),
      ),
    );
  }
}
class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.readFile,
      child: Text('read file'),
    );
  }
}