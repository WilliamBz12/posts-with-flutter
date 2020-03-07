import 'home_bloc.dart';
import 'home_service.dart';
import 'pages/comments_page.dart';
import 'repositories/post_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PostRepository(dio: AppModule.to.get())),
        Bind((i) => HomeService(postRepository: i.get())),
        Bind((i) => HomeBloc(homeService: i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router(
          '/comments',
          child: (_, args) => CommentsPage(comments: args.data),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
