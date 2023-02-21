import 'dart:math';
import 'package:finmate/components/charts/linechart.dart';
import 'package:finmate/constants/colors.dart';
import 'package:finmate/view/customers.dart';
import 'package:finmate/view/dashboard.dart';
import 'package:finmate/view/introduction.dart';
import 'package:finmate/view/orders.dart';
import 'package:finmate/view/sales.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../components/drawerstate.dart';
import '../constants/margin.dart';
import '../realm/app_services.dart';

class Render extends StatefulWidget {
  const Render({super.key});

  @override
  State<Render> createState() => _RenderState();
}

class _RenderState extends State<Render> with SingleTickerProviderStateMixin {
  bool drawerclised = true;
  bool syncon = false;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> scanimation;

  PageController pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page?.toInt() ?? 0;
      });
    });
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    scanimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    width: 280,
                    left: drawerclised ? -280 : 0,
                    height: size.height,
                    child: const SideDrawer(),
                  ),
                  Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(
                          animation.value - 50 * animation.value * pi / 180),
                    child: Transform.translate(
                        offset: Offset(animation.value * 280, 0),
                        child: Consumer<DrawerProvider>(
                            builder: ((context, value, child) {
                          if (value.menus.name == 'dashboard') {
                            return const Dashboard();
                          } else if (value.menus.name == 'orderhistory') {
                            return const Orderhistory();
                          } else if (value.menus.name == 'addorder') {
                            return const Orders();
                          } else if (value.menus.name == 'sales') {
                            return const Sales();
                          } else if (value.menus.name == 'addsales') {
                            return const AddSales();
                          } else if (value.menus.name == 'addnewcus') {
                            return const AddMembers();
                          } else if (value.menus.name == 'generalcus') {
                            return const GenCustomers();
                          } else if (value.menus.name == 'analytics') {
                            return const LineChartSample2();
                          }

                          return const Dashboard();
                        }))),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    left: drawerclised ? 0 : 220,
                    top: 17,
                    child: drawerbtn(btn: () {
                      if (drawerclised) {
                        animationController.forward();
                      } else {
                        animationController.reverse();
                      }
                      setState(() {
                        drawerclised = !drawerclised;
                      });
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
                width: size.width,
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      settingstile(size,
                          icon: 'assets/icons/set-up-950-512.png',
                          action: () {},
                          title: 'App Settings'),
                      const SizedBox(height: 20),
                      settingstile(size,
                          icon: 'assets/icons/manual.png',
                          action: () {},
                          title: 'Support'),
                      const SizedBox(height: 20),
                      settingstile(size,
                          icon: 'assets/icons/remote-control-22-512.png',
                          action: () {},
                          title: 'Share'),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width - 50,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.5),
                                  blurRadius: 10),
                            ]),
                        child: SwitchListTile(
                            activeColor: AppColors.primaryColor,
                            inactiveThumbColor: AppColors.darkGrayColor,
                            title: Row(
                              children: [
                                Image.asset('assets/icons/sync-44-64.png',
                                    color: AppColors.primaryColor,
                                    height: 40,
                                    width: 40),
                                const SizedBox(width: 30),
                                const Text('Device Sync',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17)),
                              ],
                            ),
                            value: syncon,
                            onChanged: (value) {
                              setState(() {
                                syncon = !syncon;
                              });
                            }),
                      ),
                      settingstile(size,
                          icon: 'assets/icons/sign-out-243-512.png',
                          action: () async {
                        final appServices =
                            Provider.of<AppServices>(context, listen: false);
                        await appServices.logOut().then((value) {
                          Future.delayed(
                              (const Duration(microseconds: 100)),
                              () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Introduction()),
                                  ));
                        });
                      }, title: 'Log out'),
                    ],
                  ),
                )),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: BottomNav(size: size, pagecontroller: pageController),
        ));
  }

  settingstile(Size size,
      {required String icon,
      required VoidCallback action,
      required String title}) {
    return Container(
        width: size.width - 50,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  blurRadius: 10),
            ]),
        child: GestureDetector(
          onTap: action,
          child: Row(
            children: [
              Image.asset(icon,
                  color: AppColors.primaryColor, height: 40, width: 40),
              const SizedBox(width: 50),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17)),
              const Spacer(),
              const Icon(
                Icons.arrow_circle_right_outlined,
                color: AppColors.primaryColor,
                size: 35,
              )
            ],
          ),
        ));
  }

  SafeArea drawerbtn({required VoidCallback btn}) {
    return SafeArea(
        child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Color.fromARGB(255, 16, 27, 56))
                ]),
            child: InkWell(
              onTap: btn,
              child: Image.asset(
                drawerclised ? 'assets/icons/men.png' : 'assets/icons/cl.png',
                height: 25,
                width: 25,
                color: Colors.black,
              ),
            )));
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({
    super.key,
    required this.size,
    required this.pagecontroller,
  });
  final PageController pagecontroller;

  final Size size;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentPage = 0;
  @override
  void initState() {
    widget.pagecontroller.addListener(() {
      setState(() {
        _currentPage = widget.pagecontroller.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppMP.bodypadding - 10, horizontal: AppMP.bodypadding),
      width: widget.size.width - 50,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.drawercolor.withOpacity(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == 0.0 ? Colors.white : Colors.transparent,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  widget.pagecontroller.jumpToPage(0);
                  setState(() {
                    _currentPage == 0.0;
                  });
                },
                icon: const Icon(Icons.home, size: 30),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == 1.0 ? Colors.white : Colors.transparent,
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  widget.pagecontroller.jumpToPage(1);
                  setState(() {
                    _currentPage == 1.0;
                  });
                },
                icon: const Icon(Icons.settings, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Consumer<DrawerProvider>(
      builder: (context, child, value) => Container(
          padding: const EdgeInsets.only(left: 20),
          decoration:
              BoxDecoration(color: AppColors.drawercolor.withOpacity(0.95)),
          width: 280,
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  profilecard(),
                  const SizedBox(height: 30),

                  ///
                  ///
                  Container(
                    width: 250,
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    decoration: BoxDecoration(
                        color: child.menus == Menus.dashboard
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: ListTile(
                      onTap: () =>
                          Provider.of<DrawerProvider>(context, listen: false)
                              .onupdate(DrawerProvider(menus: Menus.dashboard)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      leading: FaIcon(FontAwesomeIcons.houseChimneyCrack,
                          color: child.menus == Menus.dashboard
                              ? Colors.black
                              : Colors.white),
                      title: Text('Dashboard',
                          style: TextStyle(
                              fontFamily: "IranSans",
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: child.menus == Menus.dashboard
                                  ? Colors.black
                                  : Colors.white)),
                    ),
                  ),

                  /////
                  ///
                  ///
                  const SizedBox(height: 20),

                  ExpansionTile(
                    collapsedIconColor: Colors.white,
                    iconColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    leading: _icon('assets/icons/sales-order-details-1-64.png'),
                    title: const Text('Sales',
                        style: TextStyle(
                            fontFamily: "IranSans",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    children: [
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.sales
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(DrawerProvider(menus: Menus.sales)),
                          shape: const RoundedRectangleBorder(),
                          leading: _icon(
                              'assets/icons/sales-order-details-1-64.png'),
                          title: Text('Sales',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.sales
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.addsales
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(DrawerProvider(menus: Menus.addsales)),
                          shape: const RoundedRectangleBorder(),
                          leading: _icon('assets/icons/sales-order-10-64.png'),
                          title: Text('Add sale',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.addsales
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  /////
                  const SizedBox(height: 20),

                  ExpansionTile(
                    collapsedIconColor: child.menus == Menus.orders
                        ? Colors.black
                        : Colors.white,
                    iconColor: child.menus == Menus.orders
                        ? Colors.black
                        : Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    leading: _icon('assets/icons/orders-4-64.png'),
                    title: Text('Orders',
                        style: TextStyle(
                            fontFamily: "IranSans",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: child.menus == Menus.orders
                                ? Colors.black
                                : Colors.white)),
                    children: [
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.orderhistory
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(
                                  DrawerProvider(menus: Menus.orderhistory)),
                          leading: _icon('assets/icons/orders-4-64.png'),
                          title: Text('Orders history',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.orderhistory
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.addorder
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(DrawerProvider(menus: Menus.addorder)),
                          shape: const RoundedRectangleBorder(),
                          leading: _icon('assets/icons/add-order-1-64.png'),
                          title: Text('Fill Orders',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.addorder
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                    ],
                  ),

                  ///
                  ///
                  const SizedBox(height: 20),

                  ExpansionTile(
                    collapsedIconColor: child.menus == Menus.customers
                        ? Colors.black
                        : Colors.white,
                    iconColor: child.menus == Menus.customers
                        ? Colors.black
                        : Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    leading: _icon('assets/icons/members-4-64.png'),
                    title: Text('Customers',
                        style: TextStyle(
                            fontFamily: "IranSans",
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: child.menus == Menus.customers
                                ? Colors.black
                                : Colors.white)),
                    children: [
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.addnewcus
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(DrawerProvider(menus: Menus.addnewcus)),
                          shape: const RoundedRectangleBorder(),
                          leading: _icon(
                              'assets/icons/background-management-add-members-64.png'),
                          title: Text('Add new customer',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.addnewcus
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: BoxDecoration(
                            color: child.menus == Menus.generalcus
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: ListTile(
                          onTap: () => Provider.of<DrawerProvider>(context,
                                  listen: false)
                              .onupdate(
                                  DrawerProvider(menus: Menus.generalcus)),
                          shape: const RoundedRectangleBorder(),
                          leading: _icon('assets/icons/members-4-64.png'),
                          title: Text('General customers',
                              style: TextStyle(
                                  fontFamily: "IranSans",
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: child.menus == Menus.generalcus
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ),
                    ],
                  ),
//
                  const SizedBox(height: 20),

                  Container(
                    width: 250,
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    decoration: BoxDecoration(
                        color: child.menus == Menus.expenses
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: ListTile(
                      onTap: () =>
                          Provider.of<DrawerProvider>(context, listen: false)
                              .onupdate(DrawerProvider(menus: Menus.expenses)),
                      shape: const RoundedRectangleBorder(),
                      leading: _icon('assets/icons/expenses-1-64.png'),
                      title: Text('Expenses',
                          style: TextStyle(
                              fontFamily: "IranSans",
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: child.menus == Menus.expenses
                                  ? Colors.black
                                  : Colors.white)),
                    ),
                  ),

                  ///
                  ///
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    decoration: BoxDecoration(
                        color: child.menus == Menus.suppliers
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: ListTile(
                      onTap: () =>
                          Provider.of<DrawerProvider>(context, listen: false)
                              .onupdate(DrawerProvider(menus: Menus.suppliers)),
                      shape: const RoundedRectangleBorder(),
                      leading: _icon('assets/icons/my-suppliers-64.png'),
                      title: Text('Suppliers',
                          style: TextStyle(
                              fontFamily: "IranSans",
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: child.menus == Menus.suppliers
                                  ? Colors.black
                                  : Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: 250,
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    margin: const EdgeInsets.only(bottom: 15, top: 10),
                    decoration: BoxDecoration(
                        color: child.menus == Menus.analytics
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: ListTile(
                      onTap: () =>
                          Provider.of<DrawerProvider>(context, listen: false)
                              .onupdate(DrawerProvider(menus: Menus.analytics)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      leading: _icon('assets/icons/business-analytics-64.png'),
                      title: Text('Reports',
                          style: TextStyle(
                              fontFamily: "IranSans",
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: child.menus == Menus.analytics
                                  ? Colors.black
                                  : Colors.white)),
                    ),
                  ),

                  ///
                  ///
                ],
              ),
            ),
          )),
    ));
  }

  Image _icon(String image) => Image.asset(image, height: 40, width: 40);
}

ListTile profilecard() {
  return ListTile(
    leading: CircleAvatar(
        maxRadius: 20,
        backgroundColor: const Color.fromARGB(255, 64, 78, 109),
        child: Image.asset(
          'assets/icons/profile-35-64.png',
          width: 25,
          height: 25,
          color: Colors.white12,
        )),
    title: const Text(
      'username',
      style: TextStyle(
          fontFamily: 'IranSans',
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Colors.white),
    ),
    subtitle: const Text(
      'Retired marine, 46.',
      style: TextStyle(
          fontFamily: 'IranSans',
          fontWeight: FontWeight.w300,
          fontSize: 13,
          color: Colors.white),
    ),
  );
}
