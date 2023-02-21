import 'package:flutter/material.dart';

class AppColors {
  static const scaffoldColor = Color(0xFFEEEFEF);
  static const appBtnColor = Color.fromARGB(255, 255, 70, 70);
  static const primaryColor = Color.fromARGB(255, 70, 12, 41);
  static const lightGrayColor = Color(0xFF515151);
  static const drawercolor = Color.fromARGB(255, 70, 12, 41);

  static const grayColor = Color(0xFFD9D9D9);
  static const darkGrayColor = Color(0xFF383e5e);
  static const navBarBtnActiveColor = Color(0xFF7684f4);
  static const shadowColor = Color(0xFFCACACA);
  static const greenColor = Color(0xFF00B584);
  static const redColor = Color(0xFFA6555C);
  static const textColor = Color(0xFF000000);
  static const yellowColor = Color(0xFFE9BD49);
  static const backgroundgradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 51, 240, 240),
      Color.fromARGB(255, 186, 205, 255)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const formgradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 156, 245, 168),
      Color.fromARGB(255, 248, 212, 232)
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}









// Container(
//                 width: 240,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: child.menus == Menus.dashboard
//                         ? Colors.white
//                         : Colors.transparent,
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(20),
//                         topLeft: Radius.circular(20))),
//                 child: Center(
//                   child: Text('Dashboard',
//                       style: Theme.of(context).textTheme.titleMedium),
//                 ),
//               ),