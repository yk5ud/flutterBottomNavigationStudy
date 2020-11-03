import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sample/provider/status_provider.dart';
import 'package:flutter_sample/ui/home.dart';
import 'package:provider/provider.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 20.0),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => StatusProvider(),
        child: Home(),
      ),
    );
  }
}
