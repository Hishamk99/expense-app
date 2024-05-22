import 'package:expenses_app/cubit/expense_data_cubit.dart';
import 'package:expenses_app/helper/convert_date_to_string.dart';
import 'package:expenses_app/widgets/expense_summary.dart';
import 'package:expenses_app/widgets/list_tile_list_view.dart';
import 'package:expenses_app/widgets/show_aler_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = BlocProvider.of<ExpenseDataCubit>(context).allExpenses;

    return BlocConsumer<ExpenseDataCubit, ExpenseDataState>(
      listener: (context, state) {
         if (state is ExpenseDataSuccess) {
          data = BlocProvider.of<ExpenseDataCubit>(context).allExpenses;
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
                  const SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          'Week Total: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('\$34.5'),
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
                   ListTileListView(data: data) ,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
