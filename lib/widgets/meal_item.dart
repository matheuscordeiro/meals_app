import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../pages/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final Function deleteMeal;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.deleteMeal
      });

  void _selectMeal(BuildContext context) =>
      Navigator.of(context).pushNamed(MealDetailPage.route, arguments: id).then((result){
        if(result != null){
          deleteMeal(result);
        }
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 20),
                      )),
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(width: 5),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.card_travel),
                        SizedBox(width: 5),
                        Text(Meal.displayComplexity(complexity))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 5),
                        Text(Meal.displayAffordability(affordability))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
