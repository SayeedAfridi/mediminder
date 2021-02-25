import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/medicine_service.dart';
import '../services/notification_service.dart';
import '../ui/homepage/home_view.dart';
import '../ui/medicine/medicine_view.dart';
import '../ui/new_entry/new_entry.dart';
import '../ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    CupertinoRoute(
      page: HomeView,
    ),
    CupertinoRoute(
      page: MedicineView,
    ),
    CupertinoRoute(
      page: NewEntryView,
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NotificationService),
    LazySingleton(classType: MedicineService),
  ],
)
class App {}
