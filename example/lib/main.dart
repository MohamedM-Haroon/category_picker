import 'package:category_picker/category_picker.dart';
import 'package:category_picker/category_picker_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CategoryPicker(
          defaultSelected: 0,
          onValueChanged: (value) {
            print(value.label);
          },
          items: [
            CategoryPickerItem(
              value: "Test",
            ),
            CategoryPickerItem(
              value: "Test2",
            ),
          ],
        ),
      ),
    );
  }
}
