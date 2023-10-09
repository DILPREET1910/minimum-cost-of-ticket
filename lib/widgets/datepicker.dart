import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;
import 'package:ads_course_project_minimum_cost_of_ticket/services/dayOfYear.dart';

// sync date picker import
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class WidgetsDatePicker extends StatefulWidget {
  const WidgetsDatePicker({super.key});

  @override
  State<WidgetsDatePicker> createState() => _WidgetsDatePickerState();
}

class _WidgetsDatePickerState extends State<WidgetsDatePicker> {
  // day of year instance
  DayOfYear dayOfYear = DayOfYear();

  // date picker controller
  DateRangePickerController selectedDates = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      controller: selectedDates,
      view: DateRangePickerView.month,
      selectionMode: DateRangePickerSelectionMode.multiple,
      showActionButtons: true,
      showNavigationArrow: true,
      onSubmit: (value) {
        global.selectedDates = selectedDates.selectedDates!;
        global.listDayOfYear = dayOfYear.getListDayOfYear(global.selectedDates);
        print(global.listDayOfYear);
      },
      onCancel: () {
        selectedDates.selectedDates = [];
        print(selectedDates.selectedDates);
      },
    );
  }
}
