import 'package:realm/realm.dart';

part 'customers.g.dart';

@RealmModel()
class _Customers {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? phonenumber;
  late String? email;
  late String? customername;
  late String? houseaddress;
  late String? social;
  late String? gender;
  late double? totalspent;
}
