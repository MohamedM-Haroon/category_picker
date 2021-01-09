library category_picker;

import 'package:category_picker/category_picker_item.dart';
import 'package:flutter/material.dart';

/// An input widget to handle selection of category like choices.
///
/// Inspired by the YouTube recommendations bar on the home page
class CategoryPicker extends StatefulWidget {
  /// An input widget to handle selection of category like choices.
  ///
  /// Inspired by the YouTube recommendations bar on the home page
  CategoryPicker({
    @required this.items,
    this.defaultSelected = 0,
    this.onValueChanged,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor = Colors.transparent,
    this.selectedItemBorderColor = Colors.transparent,
    this.unselectedItemBorderColor,
    this.selectedItemTextDarkThemeColor,
    this.selectedItemTextLightThemeColor,
    this.unselectedItemTextDarkThemeColor,
    this.unselectedItemTextLightThemeColor,
    this.itemBorderRadius,
    this.itemHeight = 32.0,
    this.itemLabelFontSize = 16.0,
    this.categoryPickerMargin = const EdgeInsets.symmetric(vertical: 11),
    this.categoryPickerPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.itemMargin = const EdgeInsets.symmetric(horizontal: 4),
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12),
  });

  /// List of children to be displayed
  ///
  /// Only required parameter
  final List<CategoryPickerItem> items;

  /// Default selected item in range of `0` - `items.length`
  ///
  /// Defaults to `0`
  final int defaultSelected;

  /// Callback with entire item when user switches selection.
  ///
  /// Value of item can be accessed with `value.value`.
  final Function(CategoryPickerItem value) onValueChanged;

  /// Background color of entire category picker
  ///
  /// Defaults to `Colors.transparent`
  final Color backgroundColor;

  /// Background color of selected item
  ///
  /// Defaults to `Theme.of(context).accentColor`
  final Color selectedItemColor;

  /// Background color of all items that are not selected
  ///
  /// Defaults to `Colors.transparent`
  final Color unselectedItemColor;

  /// Border color of the selected item
  ///
  /// Defaults to `Colors.transparent`
  final Color selectedItemBorderColor;

  /// Border color of all unselected items
  ///
  /// Defaults to `Colors.grey[800]`
  final Color unselectedItemBorderColor;

  /// Text color of the text for light theme inside an item while selected
  ///
  /// Defaults to `Colors.white`
  final Color selectedItemTextLightThemeColor;

  /// Text color of the text for light theme inside an item while not selected
  ///
  /// Defaults to `Colors.black`
  final Color unselectedItemTextLightThemeColor;

  /// Text color of the text for dark theme inside an item while selected
  ///
  /// Defaults to `Colors.white`
  final Color selectedItemTextDarkThemeColor;

  /// Text color of the text for dark theme inside an item while not selected
  ///
  /// Defaults to `Colors.white`
  final Color unselectedItemTextDarkThemeColor;

  /// Border radius for all items
  ///
  /// Defaults to `BorderRadius.circular(30)`
  final BorderRadius itemBorderRadius;

  /// Height of all items
  ///
  /// Defaults to `32.0`
  final double itemHeight;

  /// Font size of the text inside of all items
  ///
  /// Defaults to `16.0`
  final double itemLabelFontSize;

  /// Padding of the entire category picker
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 16, vertical: 8)`
  final EdgeInsets categoryPickerPadding;

  /// Margin of the entire category picker
  ///
  /// Defaults to `EdgeInsets.symmetric(vertical: 11)`
  final EdgeInsets categoryPickerMargin;

  /// Padding applied to each individual item
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 12)`
  final EdgeInsets itemPadding;

  /// Margin applied to each individual item
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 4)`
  final EdgeInsets itemMargin;

  @override
  _CategoryPickerState createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  List<CategoryPickerItem> items = <CategoryPickerItem>[];
  CategoryPickerItem value;

  @override
  void initState() {
    super.initState();
    items = widget.items;

    value = items[widget.defaultSelected];
    items[widget.defaultSelected].isSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.categoryPickerPadding,
      margin: widget.categoryPickerMargin,
      color: widget.backgroundColor ?? Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: widget.itemHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        items[0].isSelected = false;
                        if (value != null) {
                          value.isSelected = false;
                        }
                        items[index].isSelected = !items[index].isSelected;
                        value = items[index];
                      });
                      widget.onValueChanged(value);
                    },
                    child: Container(
                      margin: widget.itemMargin,
                      padding: widget.itemPadding,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: items[index].isSelected
                              ? widget.selectedItemBorderColor
                              : widget.unselectedItemBorderColor ??
                                  Colors.grey[800],
                        ),
                        color: items[index].isSelected
                            ? widget.selectedItemColor ??
                                Theme.of(context).accentColor
                            : widget.unselectedItemColor,
                        borderRadius: widget.itemBorderRadius ??
                            BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          items[index].label ?? items[index].value.toString(),
                          style: TextStyle(
                            fontSize: widget.itemLabelFontSize,
                            color: items[index].isSelected
                                //Selected
                                ? Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? widget.selectedItemTextDarkThemeColor ??
                                        Colors.white
                                    : widget.selectedItemTextLightThemeColor ??
                                        Colors.white
                                //Unselected
                                : Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? widget.unselectedItemTextDarkThemeColor ??
                                        Colors.white
                                    : widget.unselectedItemTextLightThemeColor ??
                                        Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
