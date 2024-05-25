import 'package:expenses_app/cubits/expense_cubit/expenses_cubit.dart';
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
    String sunday = convertDateToString(
        startOfWeek.add(const Duration(days: 0)).toString());
    String monday = convertDateToString(
        startOfWeek.add(const Duration(days: 1)).toString());
    String tuesday = convertDateToString(
        startOfWeek.add(const Duration(days: 2)).toString());
    String wednesday = convertDateToString(
        startOfWeek.add(const Duration(days: 3)).toString());
    String thursday = convertDateToString(
        startOfWeek.add(const Duration(days: 4)).toString());
    String friday = convertDateToString(
        startOfWeek.add(const Duration(days: 5)).toString());
    String saturday = convertDateToString(
        startOfWeek.add(const Duration(days: 6)).toString());
    Map<String, double> daily =
        BlocProvider.of<ExpensesCubit>(context).dailyExpenseSummary;
    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is ExpensesMpSuccess) {
          daily = BlocProvider.of<ExpensesCubit>(context).dailyExpenseSummary;
        }
      },
      builder: (context, state) {
        return BarGraph(
          mxY: 200,
          sunAmount: daily[sunday] ?? 0,
          monAmount: daily[monday] ?? 0,
          wedAmount: daily[wednesday] ?? 0,
          friAmount: daily[friday] ?? 0,
          tueAmount: daily[tuesday] ?? 0,
          thurAmount: daily[thursday] ?? 0,
          satAmount: daily[saturday] ?? 0,
        );
      },
    );
  }
}
