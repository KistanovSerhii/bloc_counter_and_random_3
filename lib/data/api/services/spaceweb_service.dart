import 'package:dio/dio.dart';
import 'package:flutter_application_3/data/api/respond/filter_random_counter.dart';
import 'package:flutter_application_3/data/api/request/body_random_counter.dart';

class SpacewebService {
  static const _BASE_URL = 'http://qrng.anu.edu.au';
  final Dio dio = Dio(BaseOptions(baseUrl: _BASE_URL));

  Future<FilterRandomCounter> getRandomCounter(
      RequestBodyRandomCounter body) async {
    final response = await dio.get(
      "/API/jsonI.php",
      queryParameters: body.toApi(),
    );
    return FilterRandomCounter.fromApi(response.data);
  }
}
