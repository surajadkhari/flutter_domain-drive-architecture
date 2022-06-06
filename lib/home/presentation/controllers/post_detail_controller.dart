import 'package:flutter_architecture/home/data/data_model/detail_post_model.dart';
import 'package:flutter_architecture/home/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailNotifier extends StateNotifier<AsyncValue<PostDetail>> {
  PostDetailNotifier(this._postrepository, this.id)
      : super(const AsyncValue.loading()) {
    fetchDetail();
  }

  final Postrepository _postrepository;
  final String id;

  fetchDetail() async {
    final result = await _postrepository.getPostDetail(id);
    result.fold((l) => state = AsyncError(l.message), (r) => AsyncData(r));
  }
}
