import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/remote/supabase_service.dart';
import 'package:soul_talk_clone/models/comment_model.dart';

class CommentDataSource extends GetxService {
  final _supabaseClient = SupabaseService().client;

  Future<List<CommentModel>> getComments(int postId) async {
    final response = await _supabaseClient
        .from('comments')
        .select('*, users(*)')
        .eq('post_id', postId)
        .order('created_at', ascending: false);

    List<CommentModel> comments =
        response.map((e) => CommentModel.fromMap(e)).toList();

    return comments;
  }

  Future<CommentModel> createComment(CommentModel comment) async {
    final response = await _supabaseClient
        .from('comments')
        .insert(comment.toMap())
        .select()
        .single();

    CommentModel newComment = CommentModel.fromMap(response);

    return newComment;
  }
}
