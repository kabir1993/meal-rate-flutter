import 'package:flutter/material.dart';
import 'package:meal_rate_calculator/models/meal_model.dart';
import 'package:meal_rate_calculator/services/firebase_service.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Meal History')),
      body: StreamBuilder<List<Meal>>(
        stream: firebaseService.getMealHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return Center(child: Text('No meal data found'));
          }

          // Ensure that `meals` is not null and has data
          final meals = snapshot.data!;

          return ListView.builder(
            itemCount: meals.length, // This should now work
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Rate: ${meals[index].rate.toStringAsFixed(2)}'),
                subtitle: Text(
                    'Cost: ${meals[index].totalCost.toString()} Meals: ${meals[index].totalMeals}'),
              );
            },
          );
        },
      ),
    );
  }
}
