import 'package:user_post_app/providers/album_provider.dart';
import 'package:user_post_app/screens/users_album.dart';
import 'package:user_post_app/screens/users_album.dart';

import '../../providers/album_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AlbumPage extends StatelessWidget {
  int id;

  AlbumPage({
    required this.id,
  });

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
      ),
        body:ChangeNotifierProvider<AlbumProvider>(
        create: (context) => AlbumProvider(),
        child: UsersAlbum(id),
      ),
        ),
    );
  }
}
