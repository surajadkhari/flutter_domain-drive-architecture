import 'package:flutter_architecture/home/data/data_model/post_model.dart';
import 'package:flutter_architecture/home/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getPostProvider =
//     FutureProvider<Either<AppError, List<PostModel>>>((ref) async {
//   return ref.watch(postrepositoryProvider).getPost();
// });

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<PostModel>>>((ref) {
  return PostNotifier(ref.watch(postrepositoryProvider));
});

class PostNotifier extends StateNotifier<AsyncValue<List<PostModel>>> {
  PostNotifier(this._postrepository) : super(const AsyncValue.loading()) {
    fetch();
  }
  final Postrepository _postrepository;
  fetch() async {
    final result = await _postrepository.getPost();
    result.fold((l) => state = AsyncValue.error(l.message),
        ((r) => state = AsyncValue.data(r)));
  }
}
