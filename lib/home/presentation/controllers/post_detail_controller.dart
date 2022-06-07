import 'package:flutter_architecture/home/data/data_model/post_detail_model.dart';
import 'package:flutter_architecture/home/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailNotifier extends StateNotifier<AsyncValue<PostDetailModel>> {
  PostDetailNotifier(this._postrepository, this.id)
      : super(const AsyncValue.loading()) {
    fetch();
  }
  final Postrepository _postrepository;
  final int id;
  fetch() async {
    final result = await _postrepository.getPostDetail(id);
    result.fold((l) => state = AsyncValue.error(l.message),
        (r) => state = AsyncValue.data(r));
  }
}

final postDetailNotifierProvider = StateNotifierProvider.family<
    PostDetailNotifier, AsyncValue<PostDetailModel>, int>((ref, id) {
  return PostDetailNotifier(ref.watch(postrepositoryProvider), id);
});
