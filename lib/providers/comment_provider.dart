import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:user_post_app/models/comment_model.dart';

class CommentProvider extends ChangeNotifier {
  List commentList = [];
  Future<void> fetchComment(int postId) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    Response response = await get(url);

    List<CommentModel> _tempList = [];
    List list = jsonDecode(response.body);
    for (var each in list) {
      _tempList.add(CommentModel.fromJson(each));
    }
    commentList = _tempList;
  }
}
