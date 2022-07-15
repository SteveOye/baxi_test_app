import 'package:baxi_app/constant/color/app_colors.dart';
import 'package:baxi_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:baxi_app/feature/dashboard/presentation/widget/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardController dashboardController = Get.find();

  String formatValue(var number) {
    final formatCurrency = NumberFormat.currency(symbol: 'NGN');
    return formatCurrency.format(number);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    height: 220,
                    width: size.width,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 120, left: 16),
                          child: Center(
                            child: Text(
                              'Hi from Baxi,',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 10,
                  left: 10,
                  child: SizedBox(
                    width: size.width * 0.9,
                    height: 100,
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Balance'),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                dashboardController.balance.value != 0.0
                                    ? formatValue(
                                        dashboardController.balance.value)
                                    : 'NGN****',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1.7,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  GridItems(
                      size: size,
                      action: () {
                        Get.toNamed('/cable');
                      },
                      color: pink,
                      text: 'Cable TV',
                      iconData: Icons.tv_rounded),
                  GridItems(
                      size: size,
                      action: () {
                        Get.toNamed('/data');
                      },
                      color: purple,
                      text: 'Data (Internet)',
                      iconData: Icons.network_check_rounded),
                  GridItems(
                      size: size,
                      action: () {
                        Get.toNamed('/airtime');
                      },
                      color: green,
                      text: 'Airtime',
                      iconData: Icons.phone)
                ],
              ),
            )
          ],
        ),
        bottomSheet: const SizedBox(
            height: 50, child: Center(child: Text('Baxi app Client'))),
      ),
    );
  }
}
