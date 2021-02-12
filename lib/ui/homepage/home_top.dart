import 'package:flutter/material.dart';
import 'package:mediminder/ui/homepage/home_top_view_model.dart';
import 'package:stacked/stacked.dart';

import 'home_top_partial.dart';

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopViewModel>.nonReactive(
      builder: (context, model, child) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(50, 27),
              bottomRight: Radius.elliptical(50, 27),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey[400],
                offset: Offset(0, 3.5),
              )
            ],
            color: Color(0xFF3EB16F),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  "Mediminder",
                  style: TextStyle(
                    fontFamily: "Angel",
                    fontSize: 64,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                color: Color(0xFFB0F3CB),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text(
                    "Number of Mediminders",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              LengthString(),
            ],
          ),
        );
      },
      viewModelBuilder: () => TopViewModel(),
    );
  }
}
