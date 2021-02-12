import 'package:flutter/material.dart';
import 'package:mediminder/app/locator.dart';
import 'package:mediminder/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  setupLocator();
  tz.initializeTimeZones();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         brightness: Brightness.light,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Mediminder'),
//         ),
//         body: Center(
//           child: RaisedButton(
//             onPressed: () async {
//               NotificationClass notification = NotificationClass();
//               await notification.initNotifications();
//               await notification.periodicNotification();
//             },
//             child: Text('Show'),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.startupView,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter(),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
