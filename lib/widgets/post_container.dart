import 'package:flutter/material.dart';
import 'package:user_post_app/page/my_tab_bar.dart';

class PostContainer extends StatelessWidget {
  var post;
  PostContainer(this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyTabBar(id: post.id)));
    },

      child:Container(
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
            _postTitle(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Divider(
                thickness: 1,
              ),
            ),
            _postBody(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _postTitle() {
    return Row(
      children: [
        Flexible(
          child: Text(
            post.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _postBody() {
    return Text(
      post.body,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

}