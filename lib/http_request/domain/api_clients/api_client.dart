import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:json_formater_fl/http_request/domain/entity/post.dart';


class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    //Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final json = await get("https", "jsonplaceholder.typicode.com", "posts") as List<dynamic>;
    final posts = json
    .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
    .toList();
    return posts;
  }
Future<Post?> createPost({required String title, required String body}) async{
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final parameters = <String, dynamic>{
    'title': title,
    'body': body,
    'userId': 109
  };
  final request = await client.postUrl(url);
  request.headers.set('Content-type', 'application/json; charset=UTF-8');
  request.write(jsonEncode(parameters));
  final response = await request.close();
  final jsonStrings = await response.transform(utf8.decoder).toList(); 
  final jsonString = jsonStrings.join();
  final dynamic json = jsonDecode(jsonString) as Map<String, dynamic>;
  final post = Post.fromJson(json);
  return post;
}

  Future<dynamic> get(String scheme, String host, String path ) async{
    final url = Uri(scheme: scheme, host: host, path: path);
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList(); 
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }

  Future<void> fileUpload(File file) async{
    final uri = Uri.parse("https://example.com");
    final request = await client.postUrl(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, ContentType.binary);
    request.headers.add('filename', basename(file.path));
    request.contentLength = file.lengthSync();
    final fileStream = file.openRead();
    await request.addStream(fileStream);
    final HttpResponse = await request.close();
    if(HttpResponse.statusCode != 200){
      throw Exception('Error updating file');
    }else{
      return;
    }
  }
}
