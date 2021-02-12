import 'package:flutter/material.dart';
import 'package:mediminder/common/convert_time.dart';
import 'package:mediminder/ui/new_entry/new_entry_view_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class SelectTime extends HookViewModelWidget<NewEntryViewModel> {
  SelectTime({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, NewEntryViewModel model) {
    Future<TimeOfDay> _selectTime(BuildContext context) async {
      final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: model.time,
      );
      if (picked != null && picked != model.time) {
        model.updateTime(picked, true);
      }
      return picked;
    }

    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 4),
        child: FlatButton(
          color: Color(0xFF3EB16F),
          shape: StadiumBorder(),
          onPressed: () {
            _selectTime(context);
          },
          child: Center(
            child: Text(
              model.timeClicked == false
                  ? "Pick Time"
                  : "${convertTime(model.time.hour.toString())}:${convertTime(model.time.minute.toString())}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
