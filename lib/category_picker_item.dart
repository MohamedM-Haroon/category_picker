import 'package:flutter/material.dart';

/// Item supplied to the category picker
class CategoryPickerItem {
  /// Item supplied to the category picker
  ///
  ///`value` is the only required parameter,
  ///`label` will default to the string value of `value`
  CategoryPickerItem({@required this.value, this.label});

  /// Determines if the item is currently selected
  bool isSelected = false;

  /// The value of the item
  final dynamic value;

  /// String to be displayed on the item itself
  ///
  /// Will default to string value of `value` if null
  final String label;
}
