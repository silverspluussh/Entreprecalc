import 'dart:convert';
import 'package:finmate/components/drawerstate.dart';
import 'package:finmate/constants/responsive.dart';
import 'package:finmate/realm/app_services.dart';
import 'package:finmate/realm/realm_services.dart';
import 'package:finmate/view/introduction.dart';
import 'package:finmate/view/mobversion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'gen/fontgenerator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final realmconfig = json
      .decode(await rootBundle.loadString('assets/config/realmconfig.json'));
  String appId = realmconfig['appId'];
  Uri baseuri = Uri.parse(realmconfig['baseUrl']);

  await GetStorage.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(appId, baseuri)),
    ChangeNotifierProxyProvider<AppServices, RealmServices?>(
        create: (context) => null,
        update: (BuildContext context, AppServices appServices,
            RealmServices? realmServices) {
          return appServices.app.currentUser != null
              ? RealmServices(appServices.app)
              : null;
        }),
    ChangeNotifierProvider(
        create: (context) => DrawerProvider(menus: Menus.dashboard)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultFontFamily = Fontfam.iransans;

    return WillPopScope(
      onWillPop: () async => false,
      child: GetMaterialApp(
        home: const Portraitview(),
        title: "Sales Management",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.appBtnColor),
                  minimumSize: const MaterialStatePropertyAll(Size(335, 55)))),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: AppColors.primaryColor, width: 1.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: AppColors.primaryColor, width: 1.5)),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor),
              bodyLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: AppColors.textColor),
              displayLarge: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              displayMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              titleMedium: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
              headlineSmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor),
              labelLarge: TextStyle(
                fontFamily: defaultFontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              bodySmall: TextStyle(
                  fontFamily: defaultFontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: AppColors.lightGrayColor)),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

class Portraitview extends StatelessWidget {
  const Portraitview({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser =
        Provider.of<RealmServices?>(context, listen: false)?.currentUser;

    return const Responsive(mobile: Render(), desktop: SizedBox());
  }
}
