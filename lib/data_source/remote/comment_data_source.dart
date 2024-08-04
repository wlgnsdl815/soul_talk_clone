import 'package:get/get.dart';
import 'package:soul_talk_clone/models/comment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentDataSource extends GetxService {
  final supabase = Supabase.instance.client;
  Future<CommentModel> createComment(CommentModel comment) async {
    final response = await supabase
        .from('comments')
        .insert(comment.toMap())
        .select()
        .single();

    CommentModel newComment = CommentModel.fromMap(response);

    return newComment;
  }
}
