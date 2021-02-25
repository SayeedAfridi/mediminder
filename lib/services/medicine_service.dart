import 'dart:convert';
import 'package:mediminder/models/Medicine.dart';
import 'package:observable_ish/list/list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

const String MEDICINEPREF = 'medicines';

class MedicineService with ReactiveServiceMixin {
  RxList<Medicine> _meds = RxList<Medicine>();
  List<Medicine> get meds => _meds.toList();
  List<String> _medJsonList = [];

  bool get hasMeds => _meds != null;

  MedicineService() {
    listenToReactiveValues([_meds]);
  }

  Future<List<Medicine>> getAllMedicine() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String> jsonList = pref.getStringList(MEDICINEPREF);
      List<Medicine> meds = [];
      if (jsonList == null) {
        return meds;
      } else {
        for (String med in jsonList) {
          Map userMap = jsonDecode(med);
          Medicine temp = Medicine.fromJson(userMap);
          _meds.add(temp);
        }
        _medJsonList = jsonList;
        return _meds;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Medicine getMedicineById(String id) {
    if (!this.hasMeds) {
      return null;
    } else {
      Medicine med;
      _meds.forEach((m) {
        if (m.id == id) {
          med = m;
        }
      });
      return med;
    }
  }

  Future<Medicine> updateMedicine(Medicine newMedicine, String id) async {
    try {
      int i = _meds.indexWhere((element) => element.id == id);
      _meds[i] = newMedicine;
      List<String> _newMedJson = [];
      _meds.forEach((element) {
        Map<String, dynamic> medJson = element.toJson();
        _newMedJson.add(jsonEncode(medJson));
      });
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setStringList(MEDICINEPREF, _newMedJson);
      return newMedicine;
    } catch (e) {
      print(e);
      return newMedicine;
    }
  }

  Future addMedicine(Medicine med) async {
    try {
      _meds.add(med);
      Map<String, dynamic> temp = med.toJson();
      _medJsonList.add(jsonEncode(temp));
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setStringList(
        MEDICINEPREF,
        _medJsonList,
      );
    } catch (e) {
      print(e);
    }
  }

  void removeMedicine(Medicine med) async {
    if (!this.hasMeds) {
      return null;
    } else {
      _meds.remove(med);
      List<String> _newJson = [];
      _meds.forEach((element) {
        Map<String, dynamic> temp = element.toJson();
        _newJson.add(jsonEncode(temp));
      });
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setStringList(MEDICINEPREF, _newJson);
    }
  }
}
