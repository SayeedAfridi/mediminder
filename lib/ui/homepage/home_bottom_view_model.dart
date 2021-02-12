import 'package:mediminder/app/locator.dart';
import 'package:mediminder/models/Medicine.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:stacked/stacked.dart';

class BottomViewModel extends ReactiveViewModel {
  MedicineService _medicineService = locator<MedicineService>();

  bool get hasData => _medicineService.hasMeds;
  List<Medicine> get meds => _medicineService.meds;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_medicineService];
}
