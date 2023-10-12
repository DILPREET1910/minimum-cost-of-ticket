import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/pages/path.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const WidgetsDatePicker(),
              TextFormField(
                controller: global.daily,
                decoration: const InputDecoration(hintText: "cost of daily pass"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: global.weekly,
                decoration: const InputDecoration(hintText: "const of weekly pass"),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: global.monthly,
                decoration: const InputDecoration(hintText: "cost of monthly pass"),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      global.onCancel();
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const Path();
                      }));
                    },
                    child: const Text("calculate"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
