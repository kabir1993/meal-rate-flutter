import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  final double totalCost;
  final int totalMeals;
  final double rate;
  final DateTime date;

  Meal({required this.totalCost, required this.totalMeals, required this.rate, required this.date});

  factory Meal.fromMap(Map<String, dynamic> data) {
    return Meal(
      totalCost: data['totalCost'],
      totalMeals: data['totalMeals'],
      rate: data['rate'],
      date: (data['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalCost': totalCost,
      'totalMeals': totalMeals,
      'rate': rate,
      'date': date,
    };
  }
}
