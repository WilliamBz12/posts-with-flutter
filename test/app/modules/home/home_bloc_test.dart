import 'package:posts/app/models/post_model.dart';
import 'package:posts/app/modules/home/home_bloc.dart';
import 'package:posts/app/modules/home/home_module.dart';
import 'package:posts/app/modules/home/home_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeService extends Mock implements HomeService {}

void main() {
  initModule(HomeModule());
  HomeBloc bloc;
  MockHomeService mockHomeService;

  setUp(() {
    mockHomeService = MockHomeService();
    bloc = HomeBloc(homeService: mockHomeService);
  });

  group('HomeBloc Test', () {
    List<PostModel> _mockPosts = [
      PostModel(
        postId: 1,
        likes: 324,
        personId: 1,
      ),
      PostModel(
        postId: 2,
        likes: 3,
        personId: 2,
      ),
    ];

    test("First Test", () {
      expect(bloc, isInstanceOf<HomeBloc>());
    });

    test(
      "Should emits error when service return Left Side error",
      () async {
        when(mockHomeService.fetchPosts())
            .thenAnswer((_) async => Left("Not Found"));
        bloc.loadPosts();
        expect(bloc.outPosts, emitsError("Not Found"));
      },
    );

    test(
      "Should emits a list when service return Right Side",
      () async {
        when(mockHomeService.fetchPosts())
            .thenAnswer((_) async => Right(_mockPosts));
        bloc.loadPosts();
        expect(await bloc.outPosts.first, _mockPosts);

        expect(_mockPosts[0].postId, 1);
        expect(_mockPosts[1].postId, 2);
      },
    );
  });
}
