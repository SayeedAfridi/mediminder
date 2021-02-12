import 'package:mediminder/app/locator.dart';
import 'package:mediminder/services/medicine_service.dart';
import 'package:mediminder/services/notification_service.dart';
import 'package:mediminder/ui/homepage/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StratupViewModel extends BaseViewModel {
  MedicineService _medicineService = locator<MedicineService>();
  NavigationService _navigationService = locator<NavigationService>();
  NotificationService _notificationService = locator<NotificationService>();

  bool ready = false;
  bool animationComplete = false;

  Future indicateAnimationComplete() async {
    animationComplete = true;
    await onAnimationComplete();
  }

  Future onAnimationComplete() async {
    if (animationComplete && ready) {
      await _navigationService.replaceWithTransition(
        HomeView(),
        transition: 'fade',
      );
    }
  }

  Future onModelReady() async {
    await _medicineService.getAllMedicine();
    await _notificationService.initNotifications();
    ready = true;
    await onAnimationComplete();
  }
}
