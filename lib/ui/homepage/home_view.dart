import 'package:flutter/material.dart';
import 'package:mediminder/ui/homepage/home_bottom.dart';
import 'package:mediminder/ui/homepage/home_view_model.dart';
import 'package:stacked/stacked.dart';

import 'home_top.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF3EB16F),
            elevation: 0.0,
          ),
          body: Container(
            color: Color(0xFFF6F8FC),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: TopContainer(),
                ),
                Flexible(
                  flex: 6,
                  child: BottomContainer(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.navToNew,
            child: Icon(Icons.add),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
