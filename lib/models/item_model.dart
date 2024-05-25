import 'package:hive/hive.dart';
part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final String date;

  ItemModel({
    required this.name,
    required this.amount,
    required this.date,
  });
}
