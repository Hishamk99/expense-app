import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_text_field.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new expense'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            textInputType: TextInputType.name,
            hintText: 'Add new expense',
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Dollars',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextField(
                  hintText: 'Cents',
                ),
              ),
            ],
          ),
        ],
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
            Navigator.pop(context);
          },
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }
}
