import 'package:flutter/widgets.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegan = false,
      this.isVegetarian = false});

static String displayComplexity(Complexity complexity){
  switch (complexity) {
    case Complexity.Simple:
      return 'Simple';      
      break;
    case Complexity.Hard:
      return 'Hard';
      break;
    case Complexity.Challenging:
      return 'Challenging';
      break;
    default:
      return 'Unknown';
  }
}

static String displayAffordability(Affordability affordability){
  switch (affordability) {
    case Affordability.Affordable:
      return 'Affordable';      
      break;
    case Affordability.Luxurious:
      return 'Luxurious';
      break;
    case Affordability.Pricey:
      return 'Pricey';
      break;
    default:
      return 'Unknown';
  }
}
    
}


