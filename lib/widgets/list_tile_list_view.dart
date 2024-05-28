import 'package:expenses_app/cubits/expense_cubit/expenses_cubit.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_tile_item.dart';

class ListTileListView extends StatelessWidget {
  const ListTileListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        List<ItemModel> data =
            BlocProvider.of<ExpensesCubit>(context).expenses ?? [];
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: data.length,
            (context, index) {
              return ListTileItem(
                item: data[index],
              );
            },
          ),
        );
      },
    );
  }
}
