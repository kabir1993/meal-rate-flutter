import 'package:flutter/material.dart';
import 'package:meal_rate_calculator/services/firebase_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _mealCostController = TextEditingController();
  final _mealCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseService firebaseService = Provider.of<FirebaseService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Meal Rate Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _mealCostController,
              decoration: InputDecoration(labelText: 'Total Meal Cost'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _mealCountController,
              decoration: InputDecoration(labelText: 'Total Number of Meals'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double cost = double.parse(_mealCostController.text);
                int meals = int.parse(_mealCountController.text);
                firebaseService.addMeal(cost, meals);
              },
              child: Text('Save Meal Data'),
            ),
          ],
        ),
      ),
    );
  }
}
