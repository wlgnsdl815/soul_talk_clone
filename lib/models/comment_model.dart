import 'package:soul_talk_clone/models/user_model.dart';

class CommentModel {
  final int? id;
  final int postId;
  final String authorId;
  final String content;
  final DateTime? createdAt;
  final int? likesCount;
  final UserModel? author;

  CommentModel({
    this.id,
    required this.postId,
    required this.authorId,
    required this.content,
    this.createdAt,
    this.likesCount,
    this.author,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post_id': postId,
      'user_id': authorId,
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
      'likes_count': likesCount ?? 0,
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
      likesCount: map['likes_count'] ?? 0,
      author: map['users'] != null ? UserModel.fromMap(map['users']) : null,
    );
  }

  CommentModel copyWith({
    int? id,
    int? postId,
    String? authorId,
    String? content,
    DateTime? createdAt,
    int? likesCount,
    UserModel? author,
  }) {
    return CommentModel(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      authorId: authorId ?? this.authorId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
      author: author ?? this.author,
    );
  }
}
