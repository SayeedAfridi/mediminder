import 'package:mediminder/app/locator.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:stacked/stacked.dart';

class TopViewModel extends ReactiveViewModel {
  MedicineService _medicineService = locator<MedicineService>();
  int get length => _medicineService.meds.length;
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_medicineService];
}
