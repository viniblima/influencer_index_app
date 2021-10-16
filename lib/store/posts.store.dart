import 'package:dio/dio.dart';
import 'package:influencer_index_app/models/post.model.dart';
import 'package:influencer_index_app/utils/consts.dart';
import 'package:mobx/mobx.dart';

part 'posts.store.g.dart';

class PostsStore = _PostsStore with _$PostsStore;

abstract class _PostsStore with Store {
  Dio dio = Dio();

  @observable
  bool isLoading = false;

  List<Post> posts = [];

  Future<Response?> loadPostsApi() async {
    try {
      Response response = await dio.get(
        Consts.baseURL + 'posts/',
        options: Options(
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );

      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      isLoading = false;
      return null;
    }
  }

  @action
  loadPosts() {
    isLoading = true;
    posts.clear();

    loadPostsApi().then(
      (Response? element) {
        
        if (element?.statusCode == 200) {
          for(Map<String, dynamic> json in element?.data){
            posts.add(Post.fromJson(json));
          }
        }
        
        isLoading = false;
      },
    );
  }
}
