import 'package:finmate/components/drawerstate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/generalbutton.dart';
import '../constants/colors.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          margin: const EdgeInsets.only(bottom: 50),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Text('Sales History'),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.filter,
                        color: Colors.blue,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  dataRowHeight: 50,
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(5),
                    width: 1.0,
                    color: AppColors.drawercolor.withOpacity(0.95),
                  ),
                  dividerThickness: 0,
                  dataRowColor: MaterialStateColor.resolveWith((states) =>
                      AppColors.drawercolor.withOpacity(0.35).withOpacity(0.3)),
                  columns: [
                    ...headertext
                        .map((e) => DataColumn(label: _tableheadertext(e))),
                  ],
                  rows: [
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                    samplerow(context),
                  ],
                ),
              ),
            ],
          ),
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
                        .onupdate(DrawerProvider(menus: Menus.addsales));
                  },
                  icon: Icon(Icons.add)),
            ))
      ],
    );
  }

  DataRow samplerow(BuildContext context) {
    return DataRow(cells: [
      DataCell(_tableheadertext('row1')),
      DataCell(_tableheadertext('row2')),
      DataCell(_tableheadertext('row4')),
      DataCell(TextButton(
          onPressed: (() => showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: IconButton(
                        onPressed: (() {}),
                        icon: const Icon(Icons.close, size: 30)),
                    content: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        children: [],
                      ),
                    ),
                  )))),
          child: Text('modify'))),
    ]);
  }

  Text _tableheadertext(String label) => Text(
        label,
        style: const TextStyle(
            fontFamily: 'IranSans', fontWeight: FontWeight.w300, fontSize: 17),
      );
}

List<String> headertext = [
  'Product Name',
  'Selling price',
  'Quantity',
  'Action ',
];

///
///
///
///
///
///
class AddSales extends StatefulWidget {
  const AddSales({super.key});

  @override
  State<AddSales> createState() => _AddSalesState();
}

class _AddSalesState extends State<AddSales> {
  TextEditingController product = TextEditingController();
  TextEditingController customer = TextEditingController();
  TextEditingController note = TextEditingController();

  TextEditingController sellprice = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController profit = TextEditingController();
  TextEditingController status = TextEditingController();

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  'NEW SALE FORM',
                  style: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'select product ',
                    lable: 'Product',
                    controller: product),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'select customer',
                    lable: 'Customer',
                    controller: customer),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'add note ',
                    lable: 'Notes',
                    controller: note),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    inputfield(
                        width: size.width * 0.4,
                        hint: 'selling price ',
                        lable: 'Sell price ',
                        controller: sellprice),
                    inputfield(
                        width: size.width * 0.4,
                        hint: 'Quantity of item ',
                        lable: 'Quantity',
                        controller: quantity),
                  ],
                ),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: '0',
                    lable: 'Profit',
                    controller: profit),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Status',
                    lable: 'choose status',
                    controller: status),
                const SizedBox(height: 40),
                GenButton(
                  label: 'Add Sale',
                  press: () {},
                )
              ],
            ),
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
