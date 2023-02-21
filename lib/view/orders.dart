import 'dart:math';

import 'package:finmate/components/generalbutton.dart';
import 'package:finmate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../components/drawerstate.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  TextEditingController item = TextEditingController();
  TextEditingController sellprice = TextEditingController();
  TextEditingController costprice = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController supplier = TextEditingController();

  String uuid = const Uuid().v4(); // Generate a random UUID

  void generateNewUuid() {
    setState(() {
      uuid = const Uuid().v4(); // Generate a new random UUID
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'NEW ORDER FORM',
                style: TextStyle(
                    fontFamily: 'IranSans',
                    fontSize: 18,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              inputfield(
                  width: size.width,
                  hint: 'name of product',
                  lable: 'Product',
                  controller: item),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  inputfield(
                      width: size.width * 0.4,
                      hint: 'Supplier',
                      lable: 'name of supplier ',
                      controller: supplier),
                  inputfield(
                      width: size.width * 0.4,
                      hint: 'Quantity of product ',
                      lable: 'Quantity',
                      controller: quantity),
                ],
              ),
              const SizedBox(height: 20),
              inputfield(
                  width: size.width,
                  hint: 'cost price of product ',
                  lable: 'Product Cost',
                  controller: costprice),
              const SizedBox(height: 20),
              inputfield(
                  width: size.width,
                  hint: 'Selling price of product',
                  lable: 'Sell Price',
                  controller: sellprice),
              const SizedBox(height: 60),
              GenButton(
                label: 'Add Order',
                press: () {
                  generateNewUuid();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  inputfield(
      {required double width,
      required String hint,
      required String lable,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable),
        const SizedBox(height: 10),
        Container(
            width: width,
            height: 60,
            decoration: const BoxDecoration(),
            child: TextField(
              controller: controller,
              autofocus: false,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    fontFamily: 'IranSans',
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
                border: InputBorder.none,
              ),
            )),
      ],
    );
  }
}

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 100),
                    PaginatedDataTable(
                      headingRowHeight: 60,
                      source: _data,
                      header: Row(
                        children: [
                          const Text('Order History'),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.filter,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                      columns: const [
                        DataColumn(
                            label: Text(
                          'Order ID',
                          style: TextStyle(
                              fontFamily: 'IranSans',
                              fontWeight: FontWeight.w300,
                              color: AppColors.yellowColor,
                              fontSize: 17),
                        )),
                        DataColumn(
                            label: Text(
                          'Product Name',
                          style: TextStyle(
                              fontFamily: 'IranSans',
                              fontWeight: FontWeight.w300,
                              color: AppColors.primaryColor,
                              fontSize: 17),
                        )),
                        DataColumn(
                            label: Text(
                          'Quantity',
                          style: TextStyle(
                              fontFamily: 'IranSans',
                              fontWeight: FontWeight.w300,
                              color: AppColors.yellowColor,
                              fontSize: 17),
                        )),
                        DataColumn(
                            label: Text(
                          'Sell Price',
                          style: TextStyle(
                              fontFamily: 'IranSans',
                              fontWeight: FontWeight.w300,
                              color: AppColors.yellowColor,
                              fontSize: 17),
                        )),
                        DataColumn(
                            label: Text(
                          'Suppliers',
                          style: TextStyle(
                              fontFamily: 'IranSans',
                              fontWeight: FontWeight.w300,
                              color: AppColors.yellowColor,
                              fontSize: 17),
                        )),
                      ],
                      columnSpacing: 100,
                      horizontalMargin: 20,
                      rowsPerPage: 8,
                      arrowHeadColor: AppColors.yellowColor,
                      showCheckboxColumn: false,
                    )
                  ],
                ),
                Positioned(
                    bottom: 100,
                    right: 5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 5)]),
                      child: IconButton(
                          onPressed: () {
                            Provider.of<DrawerProvider>(context, listen: false)
                                .onupdate(
                                    DrawerProvider(menus: Menus.addorder));
                          },
                          icon: Icon(Icons.add)),
                    ))
              ],
            )));
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "order": 'Order $index',
            "customer": "Customer $index",
            "price": Random().nextInt(10000),
            "item": "Item $index",
            "status": "status $index",
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['order'].toString())),
      DataCell(Text(_data[index]["item"])),
      DataCell(Text(_data[index]["customer"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(Text(_data[index]["status"].toString())),
    ]);
  }
}
