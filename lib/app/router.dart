import 'package:auto_route/auto_route_annotations.dart';
import 'package:mediminder/ui/homepage/home_view.dart';
import 'package:mediminder/ui/medicine/medicine_view.dart';
import 'package:mediminder/ui/new_entry/new_entry.dart';
import 'package:mediminder/ui/startup/startup_view.dart';

@CupertinoAutoRouter(routes: [
  CupertinoRoute(page: StartupView, initial: true),
  CupertinoRoute(
    page: HomeView,
  ),
  CupertinoRoute(
    path: 'medicine/:id',
    page: MedicineView,
  ),
  CupertinoRoute(
    page: NewEntryView,
  ),
])
class $AppRouter {}
