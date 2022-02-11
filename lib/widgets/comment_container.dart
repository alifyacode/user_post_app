
import 'package:flutter/material.dart';
import 'package:user_post_app/page/album_page.dart';
import 'package:user_post_app/page/comment_page.dart';

class CommentContainer extends StatelessWidget {
  var album;
  CommentContainer(this.album);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumPage(id: album.id)));
    },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        //height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _CommentTitle(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Divider(
                  thickness: 1,
                ),
              ),
              _CommentBody(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _CommentTitle() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 30,
          ),
          SizedBox(width: 10),
          Flexible(
              child:
              Text(
            album.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          )
          )
        ],
      ),
    );
  }

  Widget _CommentBody() {
    return Text(
      album.body,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

}