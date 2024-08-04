import 'package:soul_talk_clone/models/user_model.dart';

class PostModel {
  final String? id;
  final String userId;
  final String category;
  final String title;
  final String content;
  final DateTime? createdAt;
  final List<dynamic>? comments;
  final int? commentCount;
  final int? likesCount;
  final List<String>? imageUrls;
  final UserModel? author;

  PostModel({
    this.id,
    required this.userId,
    required this.category,
    required this.title,
    required this.content,
    this.createdAt,
    this.comments,
    this.commentCount,
    this.likesCount,
    this.imageUrls,
    this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'category': category,
      'title': title,
      'content': content,
      'created_at': DateTime.now().toIso8601String(),
      'comments': comments,
      'comment_count': commentCount,
      'likes_count': likesCount,
      'image_urls': imageUrls,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'],
      userId: map['user_id'] ?? '',
      category: map['category'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      createdAt:
          DateTime.parse(map['created_at'] ?? DateTime.now().toIso8601String()),
      comments: map['comments'] ?? [],
      commentCount: map['comment_count'] ?? 0,
      likesCount: map['likes_count'] ?? 0,
      imageUrls:
          map['image_urls'] is List ? List<String>.from(map['image_urls']) : [],
      author: map['users'] != null ? UserModel.fromMap(map['users']) : null,
    );
  }
}
