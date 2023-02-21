import 'package:realm/realm.dart';

part 'suppliers.g.dart';

@RealmModel()
class _Supplier {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;

  late String? address;
  late String? phonenumber;
  late String? actualname;
  late String? email;
}
