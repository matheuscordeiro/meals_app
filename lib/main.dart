import 'package:flutter/material.dart';

import './pages/categories_page.dart';
import './pages/category_detail_page.dart';
import './pages/meal_detail_page.dart';
import './pages/preferences_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  color: Colors.white,
                  fontSize: 20))),
      // home: CategoriesPage(),  // usado o initialroute, nao se deve usar o home
      routes: {
        '/': (ctx) => CategoriesPage(),
        CategoryDetailPage.route: (ctx) => CategoryDetailPage(),
        MealDetailPage.route: (ctx) => MealDetailPage(),
        PreferencesPage.route: (ctx) => PreferencesPage()
      },
      // onGenerateRoute: (settings){return MaterialPageRoute(builder: (_) => CategoriesPage());}, // chamado quando a route não foi definida na tabela
      // onUnknownRoute: (settings){return MaterialPageRoute(builder: (_) => CategoriesPage());}, // chamado quando há um erro na rota ou onGenerateRoute não está definido
    );
  }
}
