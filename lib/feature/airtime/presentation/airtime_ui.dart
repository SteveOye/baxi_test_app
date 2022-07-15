import 'dart:math';

import 'package:baxi_app/constant/widget/input_field.dart';
import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:baxi_app/feature/airtime/controller/airtime_controller.dart';
import 'package:baxi_app/feature/airtime/data/model.dart/airtime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';

class AirtimeUi extends StatefulWidget {
  const AirtimeUi({Key? key}) : super(key: key);

  @override
  State<AirtimeUi> createState() => _AirtimeUiState();
}

class _AirtimeUiState extends State<AirtimeUi> {
  AirtimeController airtimeController = Get.find();
  String? network;
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  void initState() {
    super.initState();
    getEnvironment();
  }

  void getEnvironment() async {
    await dotenv.load();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Airtime',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 24,
            ),
            InputTextField(
              hint: '080*********',
              title: 'Phone number',
              keyboadType: TextInputType.number,
              controller: phoneController,
            ),
            const SizedBox(
              height: 24,
            ),
            InputTextField(
              hint: '0.0',
              title: 'Amount',
              keyboadType: TextInputType.number,
              controller: amountController,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Provider',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(
              height: 12,
            ),
            DropdownButtonHideUnderline(
              child: GFDropdown(
                hint: const Text('Select network'),
                padding: const EdgeInsets.all(15),
                borderRadius: BorderRadius.circular(5),
                itemHeight: 56,
                isExpanded: true,
                border: const BorderSide(color: Colors.black87, width: 1),
                dropdownButtonColor: Colors.white,
                value: network,
                onChanged: (newValue) {
                  setState(() {
                    network = newValue as String?;
                  });
                  debugPrint(newValue.toString());
                },
                items: [
                  '9 mobile',
                  'MTN',
                  'Smile',
                  'Glo',
                  'Airtel',
                ]
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {
                String amount = amountController.text.trim();
                String phone = phoneController.text.trim();
                int amountChecker = int.parse(amount);
                if (phone.isEmpty) {
                  showGetSnackBar(message: 'Enter phone number');
                } else if (amount.isEmpty) {
                  showGetSnackBar(message: 'Enter amount');
                } else if (amountChecker < 50 || amountChecker > 50000) {
                  showGetSnackBar(
                      message: 'Amount should be between NGN50 - NGN50,000');
                } else if (network.toString().isEmpty || network == null) {
                  showGetSnackBar(message: 'Select provider');
                } else if (phone.length != 11) {
                  showGetSnackBar(
                      message:
                          'Invalid number, try again. Number should be 11 digits');
                } else {
                  Airtime airtime = Airtime(
                    agentReference: getRandomString(7),
                    agentId: int.parse(dotenv.env['agentId'].toString()),
                    plan: "prepaid",
                    serviceType:
                        network.toString().replaceAll(" ", '').toLowerCase(),
                    amount: int.parse(amount),
                    phone: phone.toString(),
                  );
                  airtimeController.buyAirtime(airtime, context);
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber)),
              child: SizedBox(
                width: size.width,
                height: 48,
                child: const Center(
                  child: Text('Buy now'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
