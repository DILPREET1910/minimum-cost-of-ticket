import 'package:flutter/material.dart';

// lib imports
import 'package:ads_course_project_minimum_cost_of_ticket/main.dart';
import 'package:ads_course_project_minimum_cost_of_ticket/services/globalVariables.dart' as global;

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class Path extends StatefulWidget {
  const Path({super.key});

  @override
  State<Path> createState() => _PathState();
}

class _PathState extends State<Path> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // START: Background image
        Image.asset(
          'assets/background.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        // END: Background image
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
              child: Column(
                children: [
                  Text(
                    "Total possible paths: ${global.minNode.length}",
                    style: GoogleFonts.ubuntu(
                      fontSize: MediaQuery.of(context).size.height / 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Text(
                    "Minimum Amount: ${global.minNode[0].amount}",
                    style: GoogleFonts.ubuntu(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
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
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        width: 3,
                        color: Colors.black,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        global.onCancel();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return const Home();
                        }));
                      },
                      child: Text(
                        'Calculate more min cost',
                        style: GoogleFonts.ubuntu(
                          fontSize: MediaQuery.of(context).size.height / 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
