import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/main.dart';
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;

class Path extends StatefulWidget {
  const Path({super.key});

  @override
  State<Path> createState() => _PathState();
}

class _PathState extends State<Path> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Total possible paths: ${global.minNode.length}"),
            Text("Amount: ${global.minNode[0].amount}"),
            Expanded(
              child: ListView.builder(
                itemCount: global.minNode.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: Colors.grey[200],
                        title: Text('Path$index:\n${global.minNode[index].path}'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                global.onCancel();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const Home();
                }));
              },
              child: const Text('Calculate more min cost'),
            ),
          ],
        ),
      ),
    );
  }
}
