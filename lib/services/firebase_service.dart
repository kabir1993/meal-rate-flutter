import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_rate_calculator/models/meal_model.dart';

class FirebaseService extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addMeal(double totalCost, int totalMeals) async {
    double rate = totalCost / totalMeals;
    await _db.collection('meals').add({
      'totalCost': totalCost,
      'totalMeals': totalMeals,
      'rate': rate,
      'date': Timestamp.now(),
    });
  }

  Stream<List<Meal>> getMealHistory() {
    return _db.collection('meals').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Meal.fromMap(doc.data());
      }).toList();
    });
  }
}
