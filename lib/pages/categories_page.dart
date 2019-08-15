import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_drawer.dart';

class CategoriesPage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals List'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: DUMMY_CATEGORIES.length,
          itemBuilder: (context, index) {
            Category category = DUMMY_CATEGORIES[index];
            return CategoryItem(
                id: category.id, title: category.title, color: category.color);
          }),
      drawer: CustomDrawer(),
    );
  }
}
