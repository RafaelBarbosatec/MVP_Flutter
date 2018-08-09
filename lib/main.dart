import 'package:flutter/material.dart';
import 'package:flutter_mvp_example/injection/Injector.dart';
import 'package:flutter_mvp_example/pages/home/Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp(){
    Injector.configure(Flavor.PRO);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}
