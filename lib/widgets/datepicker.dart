import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;

// sync date picker import
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WidgetsDatePicker extends StatefulWidget {
  const WidgetsDatePicker({super.key});

  @override
  State<WidgetsDatePicker> createState() => _WidgetsDatePickerState();
}

class _WidgetsDatePickerState extends State<WidgetsDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 10,
          MediaQuery.of(context).size.height / 20,
          MediaQuery.of(context).size.width / 10,
          0,
        ),
        child: SfDateRangePicker(
          controller: global.selectedDatesController,
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.multiple,
          showNavigationArrow: true,
        ),
      ),
    );
  }
}
