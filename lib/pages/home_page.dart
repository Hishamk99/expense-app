import 'package:expenses_app/widgets/bar_graph.dart';
import 'package:expenses_app/widgets/list_tile_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
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
              SizedBox(
                height: 30,
              ),
              BarGraph(),
              SizedBox(
                height: 30,
              ),
              ListTileItem(),
              ListTileItem(),
              ListTileItem(),
              //ListTileItem(),
              // ListTileItem(),
              // ListTileItem(),
              // ListTileItem(),
              // ListTileItem(),
              // ListTileItem(),
              // ListTileItem(),
            ],
          ),
        ),
      ),
    );
  }
}
