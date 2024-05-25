part of 'expenses_cubit.dart';

@immutable
sealed class ExpensesState {}

final class ExpensesInitial extends ExpensesState {}
final class ExpensesSuccess extends ExpensesState {}
final class ExpensesMpSuccess extends ExpensesState {}
