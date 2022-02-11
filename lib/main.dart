

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_post_app/providers/post_provider.dart';
import 'package:user_post_app/screens/users_post.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter HTTP Request Using Provider',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffeeedeb),
        accentColor: Color(0xff474787),
      ),
        home: ChangeNotifierProvider<PostProvider>(
    create: (context) => PostProvider(),
    child: UsersPost(),
    ),
    );
  }
}
