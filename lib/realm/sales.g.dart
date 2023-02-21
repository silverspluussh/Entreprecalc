// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Sales extends _Sales with RealmEntity, RealmObjectBase, RealmObject {
  Sales(
    ObjectId id, {
    String? customer,
    String? product,
    String? note,
    double? sellprice,
    int? quantity,
    double? profit,
    DateTime? solddate,
    String? status,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'customer', customer);
    RealmObjectBase.set(this, 'product', product);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'sellprice', sellprice);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'profit', profit);
    RealmObjectBase.set(this, 'solddate', solddate);
    RealmObjectBase.set(this, 'status', status);
  }

  Sales._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get customer =>
      RealmObjectBase.get<String>(this, 'customer') as String?;
  @override
  set customer(String? value) => RealmObjectBase.set(this, 'customer', value);

  @override
  String? get product =>
      RealmObjectBase.get<String>(this, 'product') as String?;
  @override
  set product(String? value) => RealmObjectBase.set(this, 'product', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  double? get sellprice =>
      RealmObjectBase.get<double>(this, 'sellprice') as double?;
  @override
  set sellprice(double? value) => RealmObjectBase.set(this, 'sellprice', value);

  @override
  int? get quantity => RealmObjectBase.get<int>(this, 'quantity') as int?;
  @override
  set quantity(int? value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  double? get profit => RealmObjectBase.get<double>(this, 'profit') as double?;
  @override
  set profit(double? value) => RealmObjectBase.set(this, 'profit', value);

  @override
  DateTime? get solddate =>
      RealmObjectBase.get<DateTime>(this, 'solddate') as DateTime?;
  @override
  set solddate(DateTime? value) => RealmObjectBase.set(this, 'solddate', value);

  @override
  String? get status => RealmObjectBase.get<String>(this, 'status') as String?;
  @override
  set status(String? value) => RealmObjectBase.set(this, 'status', value);

  @override
  Stream<RealmObjectChanges<Sales>> get changes =>
      RealmObjectBase.getChanges<Sales>(this);

  @override
  Sales freeze() => RealmObjectBase.freezeObject<Sales>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Sales._);
    return const SchemaObject(ObjectType.realmObject, Sales, 'Sales', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('customer', RealmPropertyType.string, optional: true),
      SchemaProperty('product', RealmPropertyType.string, optional: true),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('sellprice', RealmPropertyType.double, optional: true),
      SchemaProperty('quantity', RealmPropertyType.int, optional: true),
      SchemaProperty('profit', RealmPropertyType.double, optional: true),
      SchemaProperty('solddate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('status', RealmPropertyType.string, optional: true),
    ]);
  }
}
