import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mediminder/ui/new_entry/new_entry_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CustomTextField extends HookViewModelWidget<NewEntryViewModel> {
  final TextInputType keyboardType;
  final TextStyle style;
  final TextCapitalization textCapitalization;
  final InputDecoration decoration;
  final Function onChanged;
  final int maxLength;
  CustomTextField(
      {this.keyboardType = TextInputType.name,
      @required this.style,
      @required this.textCapitalization,
      @required this.decoration,
      this.maxLength = 12,
      @required this.onChanged});

  @override
  Widget buildViewModelWidget(
      BuildContext context, NewEntryViewModel viewModel) {
    var _text = useTextEditingController();
    return TextFormField(
      controller: _text,
      keyboardType: keyboardType,
      style: style,
      textCapitalization: textCapitalization,
      decoration: decoration,
      onChanged: onChanged,
    );
  }
}
