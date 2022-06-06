import 'package:flutter_architecture/core/api_client.dart';
import 'package:flutter_architecture/core/api_constant.dart';
import 'package:flutter_architecture/home/data/data_model/post_model.dart';

abstract class Postdatasource {
  Future<List<PostModel>> getPost();
}

class PostdatasourceImp extends Postdatasource {
  @override
  Future<List<PostModel>> getPost() async {
    List result = await ApiClient().request(path: ApiConstant.post);
    return result.map((e) => PostModel.fromJson(e)).toList();
  }
}
