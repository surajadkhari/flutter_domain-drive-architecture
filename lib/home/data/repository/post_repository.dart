import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/error.dart';
import 'package:flutter_architecture/core/exception.dart';
import 'package:flutter_architecture/home/data/data_model/post_detail_model.dart';
import 'package:flutter_architecture/home/data/data_model/post_model.dart';
import 'package:flutter_architecture/home/data/data_source/post_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postrepositoryProvider = Provider<Postrepository>((ref) {
  return PostrepositoryImp(ref.watch(postdatasourceProvider));
});

abstract class Postrepository {
  Future<Either<AppError, List<PostModel>>> getPost();
  Future<Either<AppError, PostDetailModel>> getPostDetail(int id);
}

class PostrepositoryImp extends Postrepository {
  final Postdatasource _postdatasource;
  PostrepositoryImp(this._postdatasource);
  @override
  Future<Either<AppError, List<PostModel>>> getPost() async {
    try {
      var result = await _postdatasource.getPost();
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, PostDetailModel>> getPostDetail(int id) async {
    try {
      var result = await _postdatasource.getPostDetail(id);
      return Right(result);
    } on DioError catch (e) {
      return Left(AppError(message: e.message));
    }
  }
}
