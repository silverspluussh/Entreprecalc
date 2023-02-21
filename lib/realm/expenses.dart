import 'package:realm/realm.dart';

part 'expenses.g.dart';

@RealmModel()
class _Expenses {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? expensetitle;
  late String? details;
  late String? category;
  late double? cost;
  late DateTime? datetime;
}
