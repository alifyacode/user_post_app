import '../../providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/post_container.dart';

class UsersPost extends StatefulWidget {

  @override
  _UsersPostState createState() => _UsersPostState();
}

class _UsersPostState extends State<UsersPost> {
  bool _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // like initstate but runs multiple times
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PostProvider>(context).fetchPost().then((_) {
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
    final post = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Post",
          style: TextStyle(
            color: Color(0xff474787),
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:_isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: post.postList.length,
            itemBuilder: (context, int index) {
              return PostContainer(post.postList[index]);
            }),
    );
  }
}
