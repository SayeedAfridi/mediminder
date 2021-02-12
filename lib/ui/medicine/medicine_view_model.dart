import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mediminder/app/locator.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MedicineViewModel extends BaseViewModel {
  BottomSheetService _sheetService = locator<BottomSheetService>();
  Medicine _med;
  MedicineService _medicineService = locator<MedicineService>();
  NavigationService _navigationService = locator<NavigationService>();

  Medicine get med => _med;
  void getMed(String id) {
    _med = _medicineService.getMedicineById(id);
  }

  Future deleteRem() async {
    SheetResponse res = await _sheetService.showBottomSheet(
        title: 'Are you sure to delete?',
        cancelButtonTitle: 'Cancel',
        confirmButtonTitle: 'Confirm');
    if (res.confirmed) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      for (int i = 0; i < (24 / med.interval).floor(); i++) {
        await flutterLocalNotificationsPlugin.cancel(med.notificationIDs[i]);
      }
      _medicineService.removeMedicine(_med);
      notifyListeners();
      _navigationService.back();
    }
  }
}
