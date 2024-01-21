import 'package:flutter/material.dart';
import 'package:json_formater_fl/http_request/domain/api_clients/api_client.dart';
import 'package:json_formater_fl/http_request/domain/widgets/example/example_model.dart';

class ExampleHttpRequest extends StatefulWidget {
  const ExampleHttpRequest({super.key});

  @override
  State<ExampleHttpRequest> createState() => _ExampleHttpRequestState();
}

class _ExampleHttpRequestState extends State<ExampleHttpRequest> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ExampleModelProvider(
        model, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _ReloadButton(),
            const _CreateButton(),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _PostWidget(),
              ),
            ),
          ],
        ),
        ), 
      );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.reloadPosts(), 
      child: const Text("Reload posts!")
      );
  }
}
class _CreateButton extends StatelessWidget {
  const _CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ExampleModelProvider.read(context)?.model.createPosts(), 
      child: const Text("Create posts!")
      );
  }
}

class _PostWidget extends StatelessWidget {
  const _PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:  ExampleModelProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (BuildContext context, int index){
        return _PostRowWidget(index: index);
      },
    );
  }
}

class _PostRowWidget extends StatelessWidget {
  final int index;
  const _PostRowWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final post = ExampleModelProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10,),
        Text(post.title),
        const SizedBox(height: 10,),
        Text(post.body),
        const SizedBox(height: 40,),


      ],
    );
  }
}