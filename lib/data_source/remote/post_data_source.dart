import 'dart:io';

import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/remote/supabase_service.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDataSource extends GetxService {
  final _supabaseClient = SupabaseService().client;

  Future<void> createPost(PostModel post) async {
    if (post.imageUrls != null && post.imageUrls!.isNotEmpty) {
      final List<Future<String>> uploadFutures = [];

      for (String localPath in post.imageUrls!) {
        final file = File(localPath);
        final String fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${file.uri.pathSegments.last}';

        final uploadFuture = _supabaseClient.storage
            .from('images/post')
            .upload(fileName, file)
            .then((filePath) {
          return _supabaseClient.storage
              .from('images/post')
              .getPublicUrl(fileName);
        });

        uploadFutures.add(uploadFuture);
      }

      final List<String> uploadedUrls = await Future.wait(uploadFutures);

      post = post.copyWith(imageUrls: uploadedUrls);
    }

    await _supabaseClient.from('posts').insert(post.toMap());
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
