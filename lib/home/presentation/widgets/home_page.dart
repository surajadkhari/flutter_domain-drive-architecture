import 'package:flutter/material.dart';
import 'package:flutter_architecture/home/presentation/controllers/posts_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getPostProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ftech API with Architeture"),
      ),
      body: RefreshIndicator(
        onRefresh: (() async {
          ref.refresh(getPostProvider);
        }),
        child: data.when(
            data: (result) {
              return result.fold((l) => Text(l.message), (r) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...r.map((e) => ListTile(
                            title: Text(e.title),
                            subtitle: Text(e.body),
                          ))
                    ],
                  ),
                );
              });
            },
            error: (e, s) => Text(e.toString()),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
