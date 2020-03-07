import 'package:dio/dio.dart';

import '../../../models/post_model.dart';

class PostRepository {
  final Dio dio;
  PostRepository({this.dio});

  Future<List<PostModel>> fetchAll() async {

    final response = await dio.get("/getposts"); //method GET
    
    if (response.statusCode != 200) throw (Exception());
    List<PostModel> _posts = []; //Empty list for don't break

    if (response?.data != null) {
      response.data.forEach((item) {
        _posts.add(PostModel.fromJson(item));
      });
    }
    return _posts;
  }
}
