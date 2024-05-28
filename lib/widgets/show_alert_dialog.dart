import 'package:expenses_app/cubits/expense_cubit/expenses_cubit.dart';
import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';

class ShowAlertDialog extends StatefulWidget {
  const ShowAlertDialog({
    super.key,
  });

  @override
  State<ShowAlertDialog> createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  String? name;
  double dollars = 0, cets = 0;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new expense'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              onSaved: (val) {
                name = val;
              },
              textInputType: TextInputType.name,
              hintText: 'Add new expense',
              maxLen: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Dollars',
                    maxLen: 4,
                    onSaved: (val) {
                      dollars = double.parse(val!);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (val) {
                      cets = double.parse(val!);
                    },
                    hintText: 'Cents',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<ExpensesCubit>(context).addExpense(
                ItemModel(
                  name: name!,
                  amount: dollars + cets / 100,
                  date: DateTime.now().toString(),
                ),
              );
              BlocProvider.of<ExpensesCubit>(context).fetchAllExpenses();
              BlocProvider.of<ExpensesCubit>(context).addDailyExpense(
                ItemModel(
                  name: name!,
                  amount: dollars + (cets / 100),
                  date: DateTime.now().toString(),
                ),
              );

              Navigator.pop(context);
            }
          },
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }
}
