import 'package:expenses_app/widgets/bar_graph.dart';
import 'package:expenses_app/widgets/list_tile_list_view.dart';
import 'package:expenses_app/widgets/show_aler_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: BarGraph(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              ListTileListView()
            ],
          ),
        ),
      ),
    );
  }
}
