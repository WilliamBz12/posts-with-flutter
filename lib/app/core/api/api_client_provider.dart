import 'package:dio/dio.dart';

class ApiClientProvider {
  final Dio dio;

  ApiClientProvider(this.dio);

  Dio client() {
    dio.options.baseUrl = "https://mobile.int.granito.xyz/api/feed";
    return dio;
  }
}
