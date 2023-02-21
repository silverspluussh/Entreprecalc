import 'package:realm/realm.dart';

part 'products.g.dart';

@RealmModel()
class _Products {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? model;
  late double? sellprice;
  late double? costprice;
  late int? quantity;
  late String? category;
}
