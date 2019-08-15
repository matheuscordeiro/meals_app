import 'package:flutter/material.dart';
import '../pages/categories_page.dart';
import '../pages/preferences_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Text('Cooking UP!')),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text('Meals'),
          leading: Icon(Icons.restaurant),
          onTap: () => Navigator.of(context).pushReplacementNamed(CategoriesPage.route),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text('Preferences'),
          leading: Icon(Icons.star_border),
          onTap: () => Navigator.of(context).pushReplacementNamed(PreferencesPage.route),
        ),
      ],
    ));
  }
}
