import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.other:
        message = "Connect Failed";
        break;
      case DioErrorType.response:
        message = _handleError(
            error: dioError.response!.statusCode,
            statuscode: dioError.response!.data);
        break;
      default:
        message = "Some thing went wrong";
        break;
    }
  }
  String? message;
  String _handleError({required int statuscode, required dynamic error}) {
    switch (statuscode) {
      case 400:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 500:
        return "Internet server error ";
      default:
        return "something went wrong";
    }
  }
}
