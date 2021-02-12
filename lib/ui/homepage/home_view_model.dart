import 'package:mediminder/app/locator.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mediminder/app/router.gr.dart';

class HomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  MedicineService _medicineService = locator<MedicineService>();
  int get length => _medicineService.meds.length;
  bool get hasData => _medicineService.hasMeds;
  List<Medicine> get meds => _medicineService.meds;
  Future navToNew() async {
    await _navigationService.navigateTo(Routes.newEntryView);
  }
}
