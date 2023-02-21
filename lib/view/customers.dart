import 'package:finmate/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/drawerstate.dart';
import '../components/generalbutton.dart';

class GenCustomers extends StatelessWidget {
  const GenCustomers({super.key});

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
                  const Text(
                    'Customers Database',
                    style: TextStyle(
                        fontFamily: 'IranSans',
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.filter,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.floppyDisk,
                        color: AppColors.greenColor,
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
                      AppColors.drawercolor.withOpacity(0.95).withOpacity(0.1)),
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
      DataCell(
        TextButton(
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
          child: const Text('View Profile',
              style: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 17,
                  color: AppColors.greenColor,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    ]);
  }

  Text _tableheadertext(String label) => Text(label,
      style: const TextStyle(
          fontFamily: 'IranSans',
          fontSize: 17,
          color: AppColors.textColor,
          fontWeight: FontWeight.w300));
}

List<String> headertext = ['Customer ID', 'Customer name', 'Email', 'Action'];

class AddMembers extends StatefulWidget {
  const AddMembers({super.key});

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  TextEditingController customername = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController houseaddress = TextEditingController();
  TextEditingController social = TextEditingController();
  TextEditingController customerID = TextEditingController();
  TextEditingController gender = TextEditingController();

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
                  'NEW CUSTOMER FORM',
                  style: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Name of customer',
                    lable: 'Item',
                    controller: customername),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Phone number',
                    lable: 'Phone number',
                    controller: phonenumber),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Gender',
                    lable: 'Gender',
                    controller: email),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Email address',
                    lable: 'Email',
                    controller: email),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'House Address',
                    lable: 'House address',
                    controller: houseaddress),
                const SizedBox(height: 20),
                inputfield(
                    width: size.width,
                    hint: 'Social Media Handles',
                    lable: 'Social Media',
                    controller: social),
                const SizedBox(height: 40),
                GenButton(
                  label: 'Add Customers',
                  press: () {},
                ),
                const SizedBox(height: 60),
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
