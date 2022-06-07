import 'package:flutter/material.dart';
import 'package:flutter_architecture/home/presentation/controllers/post_detail_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetauil extends ConsumerWidget {
  const PostDetauil({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDetailNotifierProvider(id));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),
        body: data.when(
            data: (data) => SingleChildScrollView(
                  child: Card(
                    child: Text(data.titile),
                  ),
                ),
            error: (e, s) => Text(e.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
