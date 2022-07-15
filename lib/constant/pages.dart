import 'package:baxi_app/feature/airtime/presentation/airtime_ui.dart';
import 'package:baxi_app/feature/cable/presentation/cable.dart';
import 'package:baxi_app/feature/dashboard/presentation/dashboard.dart';
import 'package:baxi_app/feature/subscription/presentation/internet.dart';
import 'package:get/route_manager.dart';

final pages = [
  GetPage(name: '/', page: () => const Dashboard()),
  GetPage(name: '/airtime', page: () => const AirtimeUi()),
  GetPage(name: '/data', page: () => const BuyData()),
  GetPage(name: '/cable', page: () => const Cable()),
];
