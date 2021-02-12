import 'package:flutter/material.dart';
import 'package:mediminder/ui/new_entry/new_entry_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class IntervalSelection extends HookViewModelWidget<NewEntryViewModel> {
  IntervalSelection({Key key}) : super(key: key, reactive: true);
  final _intervals = [
    6,
    8,
    12,
    24,
  ];
  @override
  Widget buildViewModelWidget(BuildContext context, NewEntryViewModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Remind me every  ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            DropdownButton<int>(
              iconEnabledColor: Color(0xFF3EB16F),
              hint: model.interval == 0
                  ? Text(
                      "Select an Interval",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )
                  : null,
              elevation: 4,
              value: model.interval == 0 ? null : model.interval,
              items: _intervals.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newVal) {
                model.updateInterval(newVal);
              },
            ),
            Text(
              model.interval == 1 ? " hour" : " hours",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
