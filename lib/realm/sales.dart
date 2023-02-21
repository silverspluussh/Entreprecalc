import 'package:realm/realm.dart';

part 'sales.g.dart';

@RealmModel()
class _Sales {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? customer;
  late String? product;
  late String? note;
  late double? sellprice;
  late int? quantity;
  late double? profit;
  late DateTime? solddate;
  late String? status;
}
