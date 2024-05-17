import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: Colors.black,
            borderRadius: BorderRadius.circular(8),
            onPressed: (context) {},
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: const Text(
            'data',
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}',
          ),
          trailing: const Text(
            '\$35',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
