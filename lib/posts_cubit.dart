import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_post_app/data_service.dart';
import 'package:user_post_app/post.dart';

class PostCubit extends Cubit<List<Post>>{

  final _dataservice = DataService();
  PostCubit() : super([]);

  void get posts async => emit(await _dataservice.getPost());
}