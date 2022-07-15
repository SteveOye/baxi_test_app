import 'package:baxi_app/constant/controller_binding.dart';
import 'package:baxi_app/constant/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const BaxiApp());
}

class BaxiApp extends StatefulWidget {
  const BaxiApp({Key? key}) : super(key: key);

  @override
  State<BaxiApp> createState() => _BaxiAppState();
}

class _BaxiAppState extends State<BaxiApp> {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
          getPages: pages,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
                .copyWith(secondary: Colors.amber),
          ),
          debugShowCheckedModeBanner: false,
          initialBinding: ControllerBinding(),
          initialRoute: '/'),
    );
  }
}
