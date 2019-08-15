import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';


class PreferencesPage extends StatelessWidget {
  static const String route = '/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preferences'),),
      drawer: CustomDrawer(),
    );
  }
}