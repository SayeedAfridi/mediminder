import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mediminder/app/locator.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:mediminder/services/notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mediminder/common/medicine_type.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:uuid/uuid.dart';
import 'package:mediminder/common/convert_time.dart';

class NewEntryViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  MedicineService _medicineService = locator<MedicineService>();
  SnackbarService _snackbarService = locator<SnackbarService>();
  NotificationService _notificationService = locator<NotificationService>();

  String _name = '';
  String _dosage = '';
  MedicineType _type = MedicineType.Bottle;
  int _interval = 0;
  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  bool _timeClicked = false;

  TimeOfDay get time => _time;
  bool get timeClicked => _timeClicked;

  MedicineType get type => _type;

  int get interval => _interval;

  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  void updateDosage(String value) {
    _dosage = value;
    notifyListeners();
  }

  updateType(MedicineType value) {
    _type = value;
    notifyListeners();
  }

  void updateInterval(int newVal) {
    _interval = newVal;
    notifyListeners();
  }

  void updateTime(TimeOfDay picked, bool clicked) {
    _time = picked;
    _timeClicked = clicked;
    notifyListeners();
  }

  void displayError(String error) {
    _snackbarService.showSnackbar(message: error);
  }

  Future createMedicine() async {
    if (_name == '') {
      displayError("Please enter the medicine's name");
    } else if (_dosage == '') {
      displayError("Please enter the dosage required");
    } else if (interval == 0) {
      displayError("Please select the reminder's interval");
    } else if (_time == TimeOfDay(hour: 00, minute: 00)) {
      displayError("Please select the reminder's starting time");
    } else {
      String id = Uuid().v4();
      List<int> nids = makeIDs((24 / interval));
      final now = new DateTime.now();
      int hour = _time.hour;
      int minute = _time.minute;

      for (int i = 0; i < (24 / interval).floor(); i++) {
        if ((hour + (interval * i) > 23)) {
          hour = hour + (interval * i) - 24;
        } else {
          hour = hour + (interval * i);
        }
        _notificationService.scheduleNotification(
          id: nids[i],
          title: 'Mediminder: $_name',
          body:
              'It is time to take your ${_type.toString().substring(13).toLowerCase()}, according to schedule',
          scheduledTime: tz.TZDateTime.from(
              DateTime(now.year, now.month, now.day, hour, minute), tz.local),
          payload: id,
        );
      }

      Medicine med = Medicine(
        id: id,
        medicineName: _name,
        dosage: int.parse(_dosage),
        startTime: convertTime(_time.hour.toString()) +
            convertTime(_time.minute.toString()),
        interval: _interval,
        medicineType: _type.toString().substring(13),
        notificationIDs: nids,
      );
      await _medicineService.addMedicine(med);
      notifyListeners();
      _navigationService.back();
    }
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }
}
