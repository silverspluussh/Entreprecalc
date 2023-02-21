import 'package:flutter/material.dart';
import '../components/charts/lc2.dart';
import '../components/charts/linechart.dart';
import '../constants/colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 70),
              Row(
                children: [
                  DashboardContainer(
                      height: size.height * 0.2,
                      width: size.width * 0.42,
                      widget: Stack(
                        children: [
                          const LineChartSample2(),
                          _chartheadings(
                            size,
                            percentage: '+2%',
                            quantity: '\$10,000',
                            title: 'Income',
                          )
                        ],
                      )),
                  const Spacer(),
                  DashboardContainer(
                      height: size.height * 0.2,
                      width: size.width * 0.42,
                      widget: Stack(
                        children: [
                          const LineChartSample2(),
                          _chartheadings(
                            size,
                            percentage: '+1%',
                            quantity: '85',
                            title: 'Orders',
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  DashboardContainer(
                      height: size.height * 0.2,
                      width: size.width * 0.42,
                      widget: Stack(
                        children: [
                          const LineChartSample2(),
                          _chartheadings(
                            size,
                            percentage: '+9%',
                            quantity: '39',
                            title: 'Customers',
                          ),
                        ],
                      )),
                  const Spacer(),
                  DashboardContainer(
                      height: size.height * 0.2,
                      width: size.width * 0.42,
                      widget: Stack(
                        children: [
                          const LineChartSample2(),
                          _chartheadings(
                            size,
                            percentage: '+0.5',
                            quantity: '\$4,000',
                            title: 'Expenses',
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 20),
              DashboardContainer(
                  height: size.height * 0.3,
                  width: size.width,
                  widget: BarChartSample2()),
              const SizedBox(height: 20),
              DashboardContainer(
                  height: size.height * 0.33,
                  width: size.width,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Trending items',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'IranSans',
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(5),
                                  //width: 20,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: AppColors.primaryColor
                                                  .withOpacity(0.3)))),
                                  height: 90,
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.red[100],
                                            ),
                                            child: Image.asset(
                                              'assets/icons/profile-35-64.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -1,
                                              right: -3,
                                              child: CircleAvatar(
                                                maxRadius: 15,
                                                backgroundColor: AppColors
                                                    .primaryColor
                                                    .withOpacity(0.9),
                                                child: Text(
                                                  '#${index + 1}',
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                ),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(width: 40),
                                      SizedBox(
                                        height: 70,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            itemtext(
                                                title: 'Item name:    ',
                                                value: 'Soya Bean meal',
                                                color: Colors.blue),
                                            itemtext(
                                                title: 'Price:    ',
                                                value: '\$30.00',
                                                color: Colors.green),
                                            itemtext(
                                                title: 'Total orders:   ',
                                                value: '${200 + index * index}',
                                                color: Colors.pink),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _chartheadings(Size size,
      {required String quantity,
      required String percentage,
      required String title}) {
    return Positioned(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: size.width * 0.415,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      quantity,
                      style: const TextStyle(
                          fontFamily: "IranSans",
                          fontSize: 17,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      percentage,
                      style: const TextStyle(
                          fontFamily: "IranSans",
                          fontSize: 12,
                          color: Colors.green),
                    ),
                  ],
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "IranSans",
                      fontSize: 17,
                      color: AppColors.primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Row itemtext(
      {required String title, required String value, required Color color}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: "IranSans",
              fontSize: 15,
              color: color,
              fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(
              fontFamily: "IranSans",
              fontSize: 15,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class DashboardContainer extends StatelessWidget {
  const DashboardContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.widget});
  final double height;
  final double width;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.drawercolor.withOpacity(0.5), blurRadius: 10)
          ]),
      child: widget,
    );
  }
}
