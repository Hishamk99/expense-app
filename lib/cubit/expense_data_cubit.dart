import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_data_state.dart';

class ExpenseDataCubit extends Cubit<ExpenseDataState> {
  ExpenseDataCubit() : super(ExpenseDataInitial());

  List<ItemModel> allExpenses = [];
  Map<String, double> dailyExpense = {};
  double total = 0;

  void addExpense(ItemModel expense) {
    allExpenses.add(expense);

    double amount = expense.amount;
    String date = convertDateToString(expense.date);
    if (dailyExpense.containsKey(date)) {
      double current = dailyExpense[date]! + amount;

      dailyExpense[date] = current;
    } else {
      dailyExpense.addAll({date: amount});
    }
    total += amount;
    emit(ExpenseDataSuccess());
  }

  void deleteExpense(ItemModel expense) {
    String date = convertDateToString(expense.date);

    dailyExpense.remove(date);
    total -= expense.amount;
    allExpenses.remove(expense);
    emit(ExpenseDataSuccess());
  }
}
