import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const route =
      '/meal-detail'; // quando o tipo não é definido, fica por padrão dynamic

  Widget _buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: child,
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text('Ingredients',
        style: Theme.of(context).textTheme.title.copyWith(
            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 18));
  }

  @override
  Widget build(BuildContext context) {
    final String idMeal = ModalRoute.of(context).settings.arguments as String;
    final Meal meal = DUMMY_MEALS.firstWhere((Meal m) {
      return m.id == idMeal;
    });
    List<String> ingredients = meal.ingredients;
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(meal.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 20),
            _buildTitle(context, 'Ingredients'),
            SizedBox(height: 20),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(ingredients[index]),
                  ),
                );
              },
              itemCount: ingredients.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(idMeal),
      ),
    );
  }
}
