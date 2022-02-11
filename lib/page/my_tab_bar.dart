import 'package:user_post_app/providers/comment_provider.dart';
import 'package:user_post_app/screens/users_album.dart';
import 'package:user_post_app/screens/users_comment.dart';

import '../../providers/album_provider.dart';
import '../../providers/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  int id;

  MyTabBar({
    required this.id,
  });

  // static const routeName = "/my-tab-bar";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xff474787),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(0xff474787),
            ),
            tabs: [
              Tab(
                text: "Albums",
              ),
              Tab(
                text: "Comments",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChangeNotifierProvider<AlbumProvider>(
              create: (context) => AlbumProvider(),
              child: UsersAlbum(id),
            ),
            ChangeNotifierProvider<CommentProvider>(
              create: (context) => CommentProvider(),
              child: UsersComment(id),
            ),
          ],
        ),
      ),
    );
  }
}
