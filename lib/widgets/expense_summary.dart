import 'package:expenses_app/cubit/expense_data_cubit.dart';
import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bar_graph.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  final DateTime startOfWeek;

  @override
  Widget build(BuildContext context) {
    String sunday =
        convertDateToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateToString(startOfWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateToString(startOfWeek.add(const Duration(days: 4)));
    String friday =
        convertDateToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateToString(startOfWeek.add(const Duration(days: 6)));
    Map<String, double> dailyExpense =
        BlocProvider.of<ExpenseDataCubit>(context).dailyExpense;
    return BlocConsumer<ExpenseDataCubit, ExpenseDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BarGraph(
          mxY: 200,
          sunAmount: dailyExpense[sunday] ?? 0,
          monAmount: dailyExpense[monday] ?? 0,
          wedAmount: dailyExpense[wednesday] ?? 0,
          friAmount: dailyExpense[friday] ?? 0,
          tueAmount: dailyExpense[tuesday] ?? 0,
          thurAmount: dailyExpense[thursday] ?? 0,
          satAmount: dailyExpense[saturday] ?? 0,
        );
      },
    );
  }
}
