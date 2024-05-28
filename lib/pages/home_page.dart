import 'package:expenses_app/cubits/expense_cubit/expenses_cubit.dart';
import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:expenses_app/widgets/expense_summary.dart';
import 'package:expenses_app/widgets/list_tile_list_view.dart';
import 'package:expenses_app/widgets/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel>? data;
  double total = 0;
  Map<String, double> daily = {};
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExpensesCubit>(context).fetchAllExpenses();
    BlocProvider.of<ExpensesCubit>(context).dailyExpense();
    total = BlocProvider.of<ExpensesCubit>(context).total;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        total = BlocProvider.of<ExpensesCubit>(context).total;

        if (state is AddExpenseSuccess) {
          BlocProvider.of<ExpensesCubit>(context).fetchAllExpenses();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ShowAlertDialog();
                  },
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.grey[100],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        const Text(
                          'Week Total: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('\$$total'),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ExpenseSummary(
                      startOfWeek: startOfWeek(),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  const ListTileListView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
