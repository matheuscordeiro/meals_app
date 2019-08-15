import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryDetailPage extends StatefulWidget {
  static const String route = '/category-detail';

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailPageState();
  }
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  List<Meal> _meals;
  String _title;
  bool _firstLoad = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_firstLoad) {
      Map<String, String> routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      String id = routeArgs['id'];
      _meals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _title = routeArgs['title'];
      _firstLoad = false;
    }
  }

  void deleteMeal(idMeal) {
    setState(() {
      _meals.removeWhere((Meal meal) {
        return meal.id == idMeal;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
            child: ListView.builder(
          itemBuilder: (_, index) {
            return MealItem(
              id: _meals[index].id,
              title: _meals[index].title,
              imageUrl: _meals[index].imageUrl,
              affordability: _meals[index].affordability,
              complexity: _meals[index].complexity,
              duration: _meals[index].duration,
              deleteMeal: deleteMeal,
            );
          },
          itemCount: _meals.length,
        )));
  }
}
