import 'package:finmate/realm/customers.dart';
import 'package:finmate/realm/expenses.dart';
import 'package:finmate/realm/orders.dart';
import 'package:finmate/realm/products.dart';
import 'package:finmate/realm/sales.dart';
import 'package:finmate/realm/suppliers.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [
        Orders.schema,
        Customers.schema,
        Expenses.schema,
        Products.schema,
        Sales.schema,
        Supplier.schema
      ]));
      showAll = (realm.subscriptions.findByName(queryAllName) != null);
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      if (showAll) {
        // mutableSubscriptions.add(realm.all<Item>(), name: queryAllName);
      }
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> switchSubscription(bool value) async {
    showAll = value;
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        notifyListeners();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    realm.close();
  }

  @override
  void dispose() {
    realm.close();
    super.dispose();
  }
}
