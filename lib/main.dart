import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_post_app/posts_cubit.dart';
import 'package:user_post_app/posts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostCubit>(
        create: (context) => PostCubit()..posts, child: PostsView()),
    );
  }
}

