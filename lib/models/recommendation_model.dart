import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendationModel {
  final String id;
  final String fromUserId;
  final String toUserId;
  final String content;
  final DateTime createdAt;
  final List<String> likes;

  RecommendationModel({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.content,
    required this.createdAt,
    required this.likes,
  });

  factory RecommendationModel.fromMap(Map<String, dynamic> map, String id) {
    return RecommendationModel(
      id: id,
      fromUserId: map['fromUserId'],
      toUserId: map['toUserId'],
      content: map['content'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      likes: List<String>.from(map['likes'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'likes': likes,
    };
  }
} 