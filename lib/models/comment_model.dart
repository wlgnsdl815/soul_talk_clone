import 'package:soul_talk_clone/models/user_model.dart';

class CommentModel {
  final int? id;
  final int postId;
  final String authorId;
  final String content;
  final DateTime createdAt;
  final int likesCount;
  final UserModel? author;

  CommentModel({
    this.id,
    required this.postId,
    required this.authorId,
    required this.content,
    required this.createdAt,
    required this.likesCount,
    this.author,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post_id': postId,
      'user_id': authorId,
      'content': content,
      'created_at': createdAt.millisecondsSinceEpoch,
      'likes_count': likesCount,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] != null ? map['id'] as int : null,
      postId: map['post_id'] as int,
      authorId: map['user_id'] as String,
      content: map['content'] as String,
      createdAt:
          DateTime.parse(map['created_at'] ?? DateTime.now().toIso8601String()),
      likesCount: map['likes_count'] as int,
      author: map['users'] != null ? UserModel.fromMap(map['users']) : null,
    );
  }
}
