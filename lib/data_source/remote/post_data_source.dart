import 'package:get/get.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDataSource extends GetxService {
  Future<void> createPost(PostModel post) async {
    final supabase = Supabase.instance.client;
    // final response =
    //     await supabase.from('posts').insert(post.toMap()).select().single();
    // TODO: 생성한 게시글 필요하면 위 코드 사용
    await supabase.from('posts').insert(post.toMap());
  }

  // Future<List<PostModel>> getPosts() async {
  Future<void> getPosts() async {
    final supabase = Supabase.instance.client;

    final response = await supabase.from('posts').select();

    print(response);
  }
}
