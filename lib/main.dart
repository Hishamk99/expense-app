import 'package:expenses_app/models/item_model.dart';
import 'package:expenses_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'cubits/add_expense_cubit/expense_data_cubit.dart';
import 'cubits/expense_cubit/expenses_cubit.dart';

void main() async {
  debugPrint(DateTime.now().toString());
  await Hive.initFlutter();
  Hive.registerAdapter(ItemModelAdapter());
  await Hive.openBox<ItemModel>('expense');
  runApp(const ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddExpenseCubit(),
        ),
        BlocProvider(
          create: (context) => ExpensesCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
