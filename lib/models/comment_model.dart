import 'package:soul_talk_clone/models/user_model.dart';

class CommentModel {
  final String? id;
  final String userId;
  final String postId;
  final String title;
  final String content;
  final DateTime? createdAt;
  final int? likesCount;
  final UserModel? author;

  CommentModel({
    required this.id,
    required this.userId,
    required this.postId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.likesCount,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'postId': postId,
      'title': title,
      'content': content,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'likesCount': likesCount,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] as String,
      postId: map['postId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      likesCount: map['likesCount'] != null ? map['likesCount'] as int : null,
      author: map['author'] != null
          ? UserModel.fromMap(map['author'] as Map<String, dynamic>)
          : null,
    );
  }
}
