// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Orders extends _Orders with RealmEntity, RealmObjectBase, RealmObject {
  Orders(
    ObjectId id, {
    String? model,
    double? sellprice,
    double? costprice,
    int? quantity,
    String? supplier,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'model', model);
    RealmObjectBase.set(this, 'sellprice', sellprice);
    RealmObjectBase.set(this, 'costprice', costprice);
    RealmObjectBase.set(this, 'quantity', quantity);
    RealmObjectBase.set(this, 'supplier', supplier);
  }

  Orders._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get model => RealmObjectBase.get<String>(this, 'model') as String?;
  @override
  set model(String? value) => RealmObjectBase.set(this, 'model', value);

  @override
  double? get sellprice =>
      RealmObjectBase.get<double>(this, 'sellprice') as double?;
  @override
  set sellprice(double? value) => RealmObjectBase.set(this, 'sellprice', value);

  @override
  double? get costprice =>
      RealmObjectBase.get<double>(this, 'costprice') as double?;
  @override
  set costprice(double? value) => RealmObjectBase.set(this, 'costprice', value);

  @override
  int? get quantity => RealmObjectBase.get<int>(this, 'quantity') as int?;
  @override
  set quantity(int? value) => RealmObjectBase.set(this, 'quantity', value);

  @override
  String? get supplier =>
      RealmObjectBase.get<String>(this, 'supplier') as String?;
  @override
  set supplier(String? value) => RealmObjectBase.set(this, 'supplier', value);

  @override
  Stream<RealmObjectChanges<Orders>> get changes =>
      RealmObjectBase.getChanges<Orders>(this);

  @override
  Orders freeze() => RealmObjectBase.freezeObject<Orders>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Orders._);
    return const SchemaObject(ObjectType.realmObject, Orders, 'Orders', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('model', RealmPropertyType.string, optional: true),
      SchemaProperty('sellprice', RealmPropertyType.double, optional: true),
      SchemaProperty('costprice', RealmPropertyType.double, optional: true),
      SchemaProperty('quantity', RealmPropertyType.int, optional: true),
      SchemaProperty('supplier', RealmPropertyType.string, optional: true),
    ]);
  }
}
