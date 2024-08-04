import 'package:get/get.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDataSource extends GetxService {
  Future<void> createPost(PostModel post) async {
    final supabase = Supabase.instance.client;
    await supabase.from('posts').insert(post.toMap());
    // final response =
    //     await supabase.from('posts').insert(post.toMap()).select().single();
  }

  Future<List<PostModel>> getPosts() async {
    final supabase = Supabase.instance.client;

    final response = await supabase.from('posts').select();
    List<PostModel> postList =
        response.map((e) => PostModel.fromMap(e)).toList();

    return postList;
  }
}
