import 'package:expenses_app/models/item_model.dart';
import 'package:flutter/material.dart';

import 'list_tile_item.dart';

class ListTileListView extends StatelessWidget {
  const ListTileListView({
    super.key, required this.data,
  });
  final List<ItemModel> data;
  @override
  Widget build(BuildContext context) {
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
  }
}
