import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  List<ItemModel>? expenses;
  Map<String, double> dailyExpenseSummary = {};
  double total = 0;
  void fetchAllExpenses() {
    var expenseBox = Hive.box<ItemModel>('expense');

    expenses = expenseBox.values.toList();
    emit(ExpensesSuccess());
  }

  void addExpense(ItemModel expense) async {
    var expenseBox = Hive.box<ItemModel>('expense');
    await expenseBox.add(expense);
    total += expense.amount;
    emit(AddExpenseSuccess());
  }

  dailyExpense() {
    for (ItemModel expense in expenses ?? []) {
      String date = convertDateToString(expense.date);
      double amount = expense.amount;
      dailyExpenseSummary[date] = amount;
    }
    emit(EditMpSuccess());
  }

  addDailyExpense(ItemModel expense) {
    String date = convertDateToString(expense.date);
    double amount = expense.amount;

    double current = dailyExpenseSummary[date] ?? 0;
    debugPrint('Current = $current');
    dailyExpenseSummary[date] = (current + amount);

    debugPrint('mapAdd = $dailyExpenseSummary[date]');
    emit(EditMpSuccess());
  }

  removeDailyExpense(ItemModel expense) {
    String date = convertDateToString(expense.date);
    int len = 0;
    for (ItemModel expense in expenses ?? []) {
      if (date == expense.date) {
        len++;
      }
    }
    double amount = expense.amount;

    double current = dailyExpenseSummary[date] ?? 0;
    debugPrint('Current = $current');

    dailyExpenseSummary[date] = (current - amount);
    total -= amount;
    len--;
    if (len == 0) {
      dailyExpenseSummary[date] = 0;
      total = 0;
    }
    debugPrint('mapRemove = $dailyExpenseSummary[date]');

    emit(EditMpSuccess());
  }
}
