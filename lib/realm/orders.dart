import 'package:realm/realm.dart';

part 'orders.g.dart';

@RealmModel()
class _Orders {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? model;
  late double? sellprice;
  late double? costprice;
  late int? quantity;
  late String? supplier;
}
