// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../ui/homepage/home_view.dart';
import '../ui/medicine/medicine_view.dart';
import '../ui/new_entry/new_entry.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String _medicineView = 'medicine/:id';
  static String medicineView({@required dynamic id}) => 'medicine/$id';
  static const String newEntryView = '/new-entry-view';
  static const all = <String>{
    startupView,
    homeView,
    _medicineView,
    newEntryView,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes._medicineView, page: MedicineView),
    RouteDef(Routes.newEntryView, page: NewEntryView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    MedicineView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) =>
            MedicineView(id: data.pathParams['id'].stringValue),
        settings: data,
      );
    },
    NewEntryView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NewEntryView(),
        settings: data,
      );
    },
  };
}
