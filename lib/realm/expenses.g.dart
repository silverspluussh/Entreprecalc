// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Expenses extends _Expenses
    with RealmEntity, RealmObjectBase, RealmObject {
  Expenses(
    ObjectId id, {
    String? expensetitle,
    String? details,
    String? category,
    double? cost,
    DateTime? datetime,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'expensetitle', expensetitle);
    RealmObjectBase.set(this, 'details', details);
    RealmObjectBase.set(this, 'category', category);
    RealmObjectBase.set(this, 'cost', cost);
    RealmObjectBase.set(this, 'datetime', datetime);
  }

  Expenses._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get expensetitle =>
      RealmObjectBase.get<String>(this, 'expensetitle') as String?;
  @override
  set expensetitle(String? value) =>
      RealmObjectBase.set(this, 'expensetitle', value);

  @override
  String? get details =>
      RealmObjectBase.get<String>(this, 'details') as String?;
  @override
  set details(String? value) => RealmObjectBase.set(this, 'details', value);

  @override
  String? get category =>
      RealmObjectBase.get<String>(this, 'category') as String?;
  @override
  set category(String? value) => RealmObjectBase.set(this, 'category', value);

  @override
  double? get cost => RealmObjectBase.get<double>(this, 'cost') as double?;
  @override
  set cost(double? value) => RealmObjectBase.set(this, 'cost', value);

  @override
  DateTime? get datetime =>
      RealmObjectBase.get<DateTime>(this, 'datetime') as DateTime?;
  @override
  set datetime(DateTime? value) => RealmObjectBase.set(this, 'datetime', value);

  @override
  Stream<RealmObjectChanges<Expenses>> get changes =>
      RealmObjectBase.getChanges<Expenses>(this);

  @override
  Expenses freeze() => RealmObjectBase.freezeObject<Expenses>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Expenses._);
    return const SchemaObject(ObjectType.realmObject, Expenses, 'Expenses', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('expensetitle', RealmPropertyType.string, optional: true),
      SchemaProperty('details', RealmPropertyType.string, optional: true),
      SchemaProperty('category', RealmPropertyType.string, optional: true),
      SchemaProperty('cost', RealmPropertyType.double, optional: true),
      SchemaProperty('datetime', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}
