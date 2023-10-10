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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const WidgetsDatePicker(),
            TextFormField(controller: global.daily),
            TextFormField(controller: global.weekly),
            TextFormField(controller: global.monthly),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    global.onCancel();
                    global.daily.clear();
                    global.weekly.clear();
                    global.monthly.clear();
                    print('days: ${global.days}');
                    print('costs: ${global.costs}');
                  },
                  child: const Text("cancel"),
                ),
                TextButton(
                  onPressed: () {
                    global.costs.add(int.parse(global.daily.text.toString()));
                    global.costs.add(int.parse(global.weekly.text.toString()));
                    global.costs.add(int.parse(global.monthly.text.toString()));
                    global.onSubmit();
                    print('days: ${global.days}');
                    print('costs: ${global.costs}');
                    minimumCost.minCostTickets(global.days, global.costs);
                    print(global.minNode);
                    print(global.minNode[0].path);
                  },
                  child: const Text("calculate"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
