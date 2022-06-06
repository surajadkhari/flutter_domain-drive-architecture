import 'package:flutter_architecture/home/data/data_model/post_model.dart';

abstract class Postdatasource {
  Future<List<PostModel>> getPost();
}
