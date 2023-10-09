import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;
import 'package:ads_course_project_minimum_cost_of_ticket/widgets/datepicker.dart';
import 'package:ads_course_project_minimum_cost_of_ticket/services/minimumCostOfTicket.dart';

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
  // minimum cost of ticket instance
  MinimumCost minimumCost = MinimumCost();

  // text form controllers
  TextEditingController daily = TextEditingController();
  TextEditingController weekly = TextEditingController();
  TextEditingController monthly = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const WidgetsDatePicker(),
            TextFormField(controller: daily),
            TextFormField(controller: weekly),
            TextFormField(controller: monthly),
            TextButton(
              onPressed: () {
                global.costs.add(int.parse(daily.text.toString()));
                global.costs.add(int.parse(weekly.text.toString()));
                global.costs.add(int.parse(monthly.text.toString()));
                minimumCost.minCostTickets(global.days, global.costs);
                print(global.minNode);
                print(global.minNode[0].path);
              },
              child: const Text("calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
