import 'package:flutter/material.dart';

import 'bar_graph.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({
    super.key, required this.startOfWeek,
  });

  final DateTime startOfWeek;

  @override
  Widget build(BuildContext context) {

    
    return const BarGraph(
      sunAmount: 10,
      mxY: 200,
      monAmount: 100,
      wedAmount: 23,
      friAmount: 30,
      tueAmount: 34,
      thurAmount: 192,
      satAmount: 70,
    );
  }
}