import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  Menus menus;

  DrawerProvider({required this.menus});

  onupdate(DrawerProvider drawerProvider) {
    menus = drawerProvider.menus;
    notifyListeners();
  }
}

enum Menus {
  dashboard,
  menus,
  orderhistory,
  addorder,
  analytics,
  addnewcus,
  generalcus,
  menu,
  customers,
  sales,
  addsales,
  orders,
  expenses,
  suppliers,
}
