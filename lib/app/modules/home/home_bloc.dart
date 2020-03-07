import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/subjects.dart';

import '../../models/post_model.dart';
import 'home_service.dart';

class HomeBloc extends Disposable {
  final HomeService homeService;
  HomeBloc({this.homeService});

  final _postsController = BehaviorSubject<List<PostModel>>();
  Stream<List<PostModel>> get outPosts => _postsController.stream;

  void loadPosts() async {
    final result = await homeService.fetchPosts();
    //When in Left add error on stream
    //When is Right add data on stream
    result.fold(_postsController.addError, _postsController.add);

  }

  @override
  void dispose() {
    _postsController.close();
  }
}
