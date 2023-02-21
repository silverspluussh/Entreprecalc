// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Supplier extends _Supplier
    with RealmEntity, RealmObjectBase, RealmObject {
  Supplier(
    ObjectId id, {
    String? address,
    String? phonenumber,
    String? actualname,
    String? email,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'phonenumber', phonenumber);
    RealmObjectBase.set(this, 'actualname', actualname);
    RealmObjectBase.set(this, 'email', email);
  }

  Supplier._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  String? get phonenumber =>
      RealmObjectBase.get<String>(this, 'phonenumber') as String?;
  @override
  set phonenumber(String? value) =>
      RealmObjectBase.set(this, 'phonenumber', value);

  @override
  String? get actualname =>
      RealmObjectBase.get<String>(this, 'actualname') as String?;
  @override
  set actualname(String? value) =>
      RealmObjectBase.set(this, 'actualname', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  Stream<RealmObjectChanges<Supplier>> get changes =>
      RealmObjectBase.getChanges<Supplier>(this);

  @override
  Supplier freeze() => RealmObjectBase.freezeObject<Supplier>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Supplier._);
    return const SchemaObject(ObjectType.realmObject, Supplier, 'Supplier', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
      SchemaProperty('phonenumber', RealmPropertyType.string, optional: true),
      SchemaProperty('actualname', RealmPropertyType.string, optional: true),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
    ]);
  }
}
