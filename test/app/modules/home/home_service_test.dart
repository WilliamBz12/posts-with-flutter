
import 'package:posts/app/models/post_model.dart';
import 'package:posts/app/modules/home/home_service.dart';
import 'package:posts/app/modules/home/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPostRepository extends Mock implements PostRepository {}

void main() {
  HomeService service;
  MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    service = HomeService(postRepository: mockPostRepository);
  });

  group('HomeService Test', () {
    final List<PostModel> _mockPosts = [
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
      expect(service, isInstanceOf<HomeService>());
    });

    test("Should returns Left Side when request has error 404", () async {
      when(mockPostRepository.fetchAll()).thenThrow(
        DioError(response: Response(statusCode: 404)),
      );
      final result = await service.fetchPosts();
      expect(result, equals(Left("Not Found")));
    });

    test("Should returns Left Side when request has error 500", () async {
      when(mockPostRepository.fetchAll()).thenThrow(
        DioError(response: Response(statusCode: 500)),
      );
      final result = await service.fetchPosts();
      expect(result, equals(Left("Internal Server Error")));
    });

    test(
      "Should returns all items in Right Side when repository return a list",
      () async {
        when(mockPostRepository.fetchAll()).thenAnswer((_) async => _mockPosts);
        final result = await service.fetchPosts();

        result.fold(
          (error) => expect(error, isNull),
          (list) async {
            expect(list, isInstanceOf<List<PostModel>>());
            expect(list.length, 2);
            expect(list[0].postId, 1);
            expect(list[1].postId, 2);
          },
        );
      },
    );
  });
}
