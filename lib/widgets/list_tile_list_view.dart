import 'package:flutter/material.dart';

import 'list_tile_item.dart';

class ListTileListView extends StatelessWidget {
  const ListTileListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) {
          return const ListTileItem();
        },
      ),
    );
  }
}
