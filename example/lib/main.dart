import 'package:category_picker/category_picker.dart';
import 'package:category_picker/category_picker_item.dart';
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
          items: [
            CategoryPickerItem(
              value: "Test",
            ),
            CategoryPickerItem(
              value: "Test2",
            ),
            CategoryPickerItem(
              value: "Test3",
            ),
          ],
          defaultSelected: 0,
          onValueChanged: (value) {
            print(value.label);
          },
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.transparent,
          selectedItemBorderColor: Colors.transparent,
          unselectedItemBorderColor: Colors.grey[800],
          selectedItemTextDarkThemeColor: Colors.white,
          selectedItemTextLightThemeColor: Colors.black,
          unselectedItemTextDarkThemeColor: Colors.white,
          unselectedItemTextLightThemeColor: Colors.white,
          itemBorderRadius: BorderRadius.circular(30),
          itemHeight: 32.0,
          itemLabelFontSize: 16.0,
          categoryPickerMargin: const EdgeInsets.symmetric(vertical: 11),
          categoryPickerPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemMargin: const EdgeInsets.symmetric(horizontal: 4),
          itemPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
