import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/recommendation_model.dart';

class RecommendationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new recommendation
  Future<void> createRecommendation({
    required String fromUserId,
    required String toUserId,
    required String content,
  }) async {
    final recommendation = RecommendationModel(
      id: '',
      fromUserId: fromUserId,
      toUserId: toUserId,
      content: content,
      createdAt: DateTime.now(),
      likes: [],
    );

    await _firestore.collection('recommendations').add(recommendation.toMap());
  }

  // Get recommendations for feed
  Stream<List<RecommendationModel>> getRecommendationsFeed() {
    return _firestore
        .collection('recommendations')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecommendationModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }

  // Get user's recommendations
  Stream<List<RecommendationModel>> getUserRecommendations(String userId) {
    return _firestore
        .collection('recommendations')
        .where('fromUserId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecommendationModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }

  // Get recommendations received by user
  Stream<List<RecommendationModel>> getReceivedRecommendations(String userId) {
    return _firestore
        .collection('recommendations')
        .where('toUserId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RecommendationModel.fromMap(
          doc.data(),
          doc.id,
        );
      }).toList();
    });
  }
} 