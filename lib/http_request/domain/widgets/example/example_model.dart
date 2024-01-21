import 'package:flutter/material.dart';
import 'package:json_formater_fl/http_request/domain/api_clients/api_client.dart';
import 'package:json_formater_fl/http_request/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier{
  final apiClient = ApiClient();
  var _posts = <Post>[];
  List<Post> get posts => _posts;
  Future<void> reloadPosts() async{
    final posts = await apiClient.getPosts();
    _posts += posts;
    notifyListeners();
  }
  void createPosts() async{
    final post = await apiClient.createPost(title: "dvd", body: "vdsvs");
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleModelProvider(this.model, {super.key, required this.child}) : super( notifier: model, child: child);

  final Widget child;

  static ExampleModelProvider? watch(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context){
    final widget = context.getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
    ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }

}