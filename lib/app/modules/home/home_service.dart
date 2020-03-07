import 'dart:async';
import 'dart:io';
import 'repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../models/post_model.dart';

class HomeService {
  final PostRepository postRepository;
  HomeService({this.postRepository});

  Future<Either<String, List<PostModel>>> fetchPosts() async {
    try {
      final response = await postRepository.fetchAll();
      return Right(response);
    } on SocketException {
      return Left("Connection Error");
    } on DioError catch (e) {
      switch (e.response.statusCode) {
        case 401:
          return Left("Invalid Request");
        case 404:
          return Left("Not Found");
        case 500:
          return Left("Internal Server Error");
          break;
        default:
          return Left("Unknown Error");
      }
    }
  }
}
