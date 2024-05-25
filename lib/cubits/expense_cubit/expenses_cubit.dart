import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  List<ItemModel>? expenses;
  void fetchAllExpenses() {
    var expenseBox = Hive.box<ItemModel>('expense');

    expenses = expenseBox.values.toList();
    emit(ExpensesSuccess());
  }
}
