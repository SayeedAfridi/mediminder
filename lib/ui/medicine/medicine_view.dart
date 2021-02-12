import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:mediminder/ui/medicine/expanded_section.dart';
import 'package:mediminder/ui/medicine/main_section.dart';
import 'package:mediminder/ui/medicine/medicine_view_model.dart';
import 'package:stacked/stacked.dart';

class MedicineView extends StatelessWidget {
  final String id;
  const MedicineView({
    @PathParam() this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MedicineViewModel>.nonReactive(
      builder: (context, model, child) {
        model.getMed(this.id);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Color(0xFF3EB16F),
            ),
            centerTitle: true,
            title: Text(
              "Mediminder Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            elevation: 0.0,
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MainSection(medicine: model.med),
                  SizedBox(
                    height: 15,
                  ),
                  ExtendedSection(medicine: model.med),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.06,
                      right: MediaQuery.of(context).size.height * 0.06,
                      top: 25,
                    ),
                    child: Container(
                      width: 250,
                      height: 60,
                      child: FlatButton(
                        color: Color(0xFF3EB16F),
                        shape: StadiumBorder(),
                        onPressed: model.deleteRem,
                        child: Center(
                          child: Text(
                            "Delete Mediminder",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => MedicineViewModel(),
    );
  }
}
