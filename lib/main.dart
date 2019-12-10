import 'package:flutter/material.dart';
import 'app/pages/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Clean ToDo',
    home: HomeView(),
  );
}
