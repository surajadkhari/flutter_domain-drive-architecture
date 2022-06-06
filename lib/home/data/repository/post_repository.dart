import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/error.dart';
import 'package:flutter_architecture/home/data/data_model/post_model.dart';
import 'package:flutter_architecture/home/data/data_source/post_data_source.dart';

abstract class Postrepository {
  Future<Either<AppError, List<PostModel>>> getPost();
}

class PostrepositoryImp extends Postrepository {
  @override
  Future<Either<AppError, List<PostModel>>> getPost() async {
    try {
      var result = await PostdatasourceImp().getPost();
      return Right(result);
    } on DioError catch (e) {
      return Left(AppError(message: e.message));
    }
  }
}
