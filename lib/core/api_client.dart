import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/api_constant.dart';

class ApiClient {
  Future request({required String path, String type = "get"}) async {
    // final response = await Dio(
    //   BaseOptions(baseUrl: ApiConstant.baseUrl),
    // ).get(path);

    try {
      final response = type == 'get'
          ? await Dio(
              BaseOptions(baseUrl: ApiConstant.baseUrl),
            ).get(path)
          : type == "resgister"
              ? await Dio(BaseOptions(baseUrl: ApiConstant.baseUrl)).post(path)
              : await Dio(
                  BaseOptions(baseUrl: ApiConstant.baseUrl),
                ).post(path);
      response.data;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
