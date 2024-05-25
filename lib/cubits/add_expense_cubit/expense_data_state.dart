part of 'expense_data_cubit.dart';

@immutable
sealed class ExpenseDataState {}

final class ExpenseDataInitial extends ExpenseDataState {}

final class AddExpenseSuccess extends ExpenseDataState {}
