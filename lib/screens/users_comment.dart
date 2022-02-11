import '../providers/comment_provider.dart';
import '../widgets/comment_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersComment extends StatefulWidget {
  int postId;
  UsersComment(this.postId);
  @override
  _UsersCommentState createState() => _UsersCommentState();
}

class _UsersCommentState extends State<UsersComment> {
  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // like initstate but runs multiple times
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CommentProvider>(context).fetchComment(widget.postId).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CommentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Comment",
          style: TextStyle(
            color: Color(0xff474787),
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: user.commentList.length,
              itemBuilder: (context, int index) {
                // separate user container widget
                return CommentContainer(user.commentList[index]);
              },
            ),
    );
  }
}
