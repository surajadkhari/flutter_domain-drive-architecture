import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/core/error.dart';
import 'package:flutter_architecture/home/data/data_model/post_model.dart';
import 'package:flutter_architecture/home/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPostProvider =
    FutureProvider<Either<AppError, List<PostModel>>>((ref) async {
  return ref.watch(postrepositoryProvider).getPost();
});
