import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_post_app/post.dart';

class DataService{
  final _baseUrl = 'jsonplaceholder.typicode.com';

  Future<List<Post>> getPost() async{
    try{
      final uri = Uri.https(_baseUrl, '/posts');
      final response = await http.get(uri);
      if (response.statusCode == 200){
        final json = jsonDecode(response.body) as List;
        final posts = json.map((e) => Post.fromJson(e)).toList();
        return posts;
      }else{
        throw Exception('Failed to load post');
      }
    } catch(e){
      rethrow;
    }

  }
}