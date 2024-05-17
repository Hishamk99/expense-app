import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_data_state.dart';

class ExpenseDataCubit extends Cubit<ExpenseDataState> {
  ExpenseDataCubit() : super(ExpenseDataInitial());
}
