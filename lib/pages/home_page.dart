import 'package:expenses_app/widgets/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Row(
              children: [
                Text(
                  'Week Total: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$34.5'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BarGraph(),
          ],
        ),
      ),
    );
  }
}


