// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Customers extends _Customers
    with RealmEntity, RealmObjectBase, RealmObject {
  Customers(
    ObjectId id, {
    String? phonenumber,
    String? email,
    String? customername,
    String? houseaddress,
    String? social,
    String? gender,
    double? totalspent,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'phonenumber', phonenumber);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'customername', customername);
    RealmObjectBase.set(this, 'houseaddress', houseaddress);
    RealmObjectBase.set(this, 'social', social);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'totalspent', totalspent);
  }

  Customers._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get phonenumber =>
      RealmObjectBase.get<String>(this, 'phonenumber') as String?;
  @override
  set phonenumber(String? value) =>
      RealmObjectBase.set(this, 'phonenumber', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  String? get customername =>
      RealmObjectBase.get<String>(this, 'customername') as String?;
  @override
  set customername(String? value) =>
      RealmObjectBase.set(this, 'customername', value);

  @override
  String? get houseaddress =>
      RealmObjectBase.get<String>(this, 'houseaddress') as String?;
  @override
  set houseaddress(String? value) =>
      RealmObjectBase.set(this, 'houseaddress', value);

  @override
  String? get social => RealmObjectBase.get<String>(this, 'social') as String?;
  @override
  set social(String? value) => RealmObjectBase.set(this, 'social', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  double? get totalspent =>
      RealmObjectBase.get<double>(this, 'totalspent') as double?;
  @override
  set totalspent(double? value) =>
      RealmObjectBase.set(this, 'totalspent', value);

  @override
  Stream<RealmObjectChanges<Customers>> get changes =>
      RealmObjectBase.getChanges<Customers>(this);

  @override
  Customers freeze() => RealmObjectBase.freezeObject<Customers>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Customers._);
    return const SchemaObject(ObjectType.realmObject, Customers, 'Customers', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('phonenumber', RealmPropertyType.string, optional: true),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
      SchemaProperty('customername', RealmPropertyType.string, optional: true),
      SchemaProperty('houseaddress', RealmPropertyType.string, optional: true),
      SchemaProperty('social', RealmPropertyType.string, optional: true),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('totalspent', RealmPropertyType.double, optional: true),
    ]);
  }
}
