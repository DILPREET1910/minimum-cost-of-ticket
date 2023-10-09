import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;

// syncfusion date picker imports
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // date picker controller
  DateRangePickerController selectedDates = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SfDateRangePicker(
              controller: selectedDates,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.multiple,
              showActionButtons: true,
              showNavigationArrow: true,
              onSubmit: (value) {
                print(selectedDates.selectedDates);
              },
              onCancel: () {
                selectedDates.selectedDates = [];
                print(selectedDates.selectedDates);
              },
            ),
            const Card(
              child: Text("daily weekly monthly here"),
            ),
          ],
        ),
      ),
    );
  }
}
