import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'expense_data_state.dart';

class AddExpenseCubit extends Cubit<ExpenseDataState> {
  AddExpenseCubit() : super(ExpenseDataInitial());

  Map<String, double> dailyExpense = {};
  double total = 0;

  void addExpense(ItemModel expense) async {
    var expenseBox = Hive.box<ItemModel>('expense');
    await expenseBox.add(expense);

    emit(AddExpenseSuccess());
  }

  void deleteExpense(ItemModel expense) {
    String date = convertDateToString(expense.date);

    dailyExpense.remove(date);
    total -= expense.amount;
    //allExpenses.remove(expense);
    emit(AddExpenseSuccess());
  }
}
