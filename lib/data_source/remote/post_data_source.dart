import 'package:get/get.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDataSource extends GetxService {
  Future<void> createPost(PostModel post) async {
    final supabase = Supabase.instance.client;
    await supabase.from('posts').insert(post.toMap());
  }

  Future<List<PostModel>> getPosts() async {
    final supabase = Supabase.instance.client;

    final response = await supabase
        .from('posts')
        .select('*, users(*)')
        .order('created_at', ascending: false);

    var posts =
        (response as List).map<PostModel>((e) => PostModel.fromMap(e)).toList();
    posts.sort((a, b) {
      if (a.category == '공지' && b.category != '공지') {
        return -1;
      }
      if (a.category != '공지' && b.category == '공지') {
        return 1;
      }

      return b.createdAt!.compareTo(a.createdAt!);
    });

    return posts;
  }
}
