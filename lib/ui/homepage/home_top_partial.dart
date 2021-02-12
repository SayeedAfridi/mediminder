import 'package:flutter/material.dart';
import 'package:mediminder/ui/homepage/home_top_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class LengthString extends HookViewModelWidget<TopViewModel> {
  LengthString({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, TopViewModel model) {
    return Text(
      model.length.toString(),
      style: TextStyle(
        fontFamily: "Neu",
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
