import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mediminder/ui/new_entry/interval_selection.dart';
import 'package:mediminder/ui/new_entry/medicine_type_column.dart';
import 'package:mediminder/ui/new_entry/new_entry_view_model.dart';
import 'package:mediminder/ui/new_entry/panel_title.dart';
import 'package:mediminder/ui/new_entry/select_time.dart';
import 'package:mediminder/ui/new_entry/text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:mediminder/common/medicine_type.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class NewEntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewEntryViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Color(0xFF3EB16F),
            ),
            centerTitle: true,
            title: Text(
              "Add New Mediminder",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            elevation: 0.0,
          ),
          body: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              children: <Widget>[
                PanelTitle(
                  title: "Medicine Name",
                  isRequired: true,
                ),
                CustomTextField(
                  maxLength: 12,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  onChanged: model.updateName,
                ),
                PanelTitle(
                  title: "Dosage in mg",
                  isRequired: false,
                ),
                CustomTextField(
                  onChanged: model.updateDosage,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                PanelTitle(
                  title: "Medicine Type",
                  isRequired: false,
                ),
                TypeColumns(),
                PanelTitle(
                  title: "Interval Selection",
                  isRequired: true,
                ),
                //ScheduleCheckBoxes(),
                IntervalSelection(),
                PanelTitle(
                  title: "Starting Time",
                  isRequired: true,
                ),
                SelectTime(),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.height * 0.08,
                  ),
                  child: Container(
                    width: 220,
                    height: 60,
                    child: FlatButton(
                      color: Color(0xFF3EB16F),
                      shape: StadiumBorder(),
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      onPressed: model.createMedicine,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => NewEntryViewModel(),
    );
  }
}

class TypeColumns extends HookViewModelWidget<NewEntryViewModel> {
  const TypeColumns({
    Key key,
  }) : super(key: key, reactive: true);
  @override
  Widget buildViewModelWidget(BuildContext context, NewEntryViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MedicineTypeColumn(
          onTap: () => model.updateType(MedicineType.Bottle),
          type: MedicineType.Bottle,
          name: "Bottle",
          iconValue: 0xe900,
          isSelected: model.type == MedicineType.Bottle ? true : false,
        ),
        MedicineTypeColumn(
          onTap: () => model.updateType(MedicineType.Pill),
          type: MedicineType.Pill,
          name: "Pill",
          iconValue: 0xe901,
          isSelected: model.type == MedicineType.Pill ? true : false,
        ),
        MedicineTypeColumn(
          onTap: () => model.updateType(MedicineType.Syringe),
          type: MedicineType.Syringe,
          name: "Syringe",
          iconValue: 0xe902,
          isSelected: model.type == MedicineType.Syringe ? true : false,
        ),
        MedicineTypeColumn(
          onTap: () => model.updateType(MedicineType.Tablet),
          type: MedicineType.Tablet,
          name: "Tablet",
          iconValue: 0xe903,
          isSelected: model.type == MedicineType.Tablet ? true : false,
        ),
      ],
    );
  }
}
