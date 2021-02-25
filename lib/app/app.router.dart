// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/homepage/home_view.dart';
import '../ui/medicine/medicine_view.dart';
import '../ui/new_entry/new_entry.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String medicineView = '/medicine-view';
  static const String newEntryView = '/new-entry-view';
  static const all = <String>{
    startupView,
    homeView,
    medicineView,
    newEntryView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.medicineView, page: MedicineView),
    RouteDef(Routes.newEntryView, page: NewEntryView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
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
      var args = data.getArgs<MedicineViewArguments>(
        orElse: () => MedicineViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MedicineView(
          key: args.key,
          id: args.id,
        ),
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

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MedicineView arguments holder class
class MedicineViewArguments {
  final Key key;
  final String id;
  MedicineViewArguments({this.key, this.id});
}
