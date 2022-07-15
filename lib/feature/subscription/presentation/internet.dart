import 'dart:math';

import 'package:baxi_app/constant/widget/input_field.dart';
import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';

import '../../subscription/controller/data_controller.dart';
import '../../subscription/data/model/data_request.dart';

class BuyData extends StatefulWidget {
  const BuyData({Key? key}) : super(key: key);

  @override
  State<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends State<BuyData> {
  final DataController _dataController = Get.find();
  TextEditingController phoneController = TextEditingController();
  String? network;
  String? plan;
  List<String>? listOfPlans;
  int index = 0;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getReference(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Buy Airtime',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontSize: 24),
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
                    network = newValue as String;
                    plan = null;
                    _dataController.getPlans(network!.toLowerCase(), context);
                  });
                },
                items: [
                  '9mobile',
                  'Airtel',
                  'Glo',
                  'MTN',
                ]
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Plans',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(
              height: 12,
            ),
            Obx(
              () => DropdownButtonHideUnderline(
                child: GFDropdown(
                  hint: const Text('Select plans'),
                  padding: const EdgeInsets.all(15),
                  borderRadius: BorderRadius.circular(5),
                  itemHeight: 56,
                  isExpanded: true,
                  border: const BorderSide(color: Colors.black87, width: 1),
                  dropdownButtonColor: Colors.white,
                  value: plan,
                  onChanged: (newValue) {
                    setState(() {
                      plan = newValue as String;
                      index = _dataController.listOfPlans.indexOf(newValue);
                    });
                  },
                  items: _dataController.listOfPlans
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InputTextField(
              hint: '080******',
              title: 'Phone Number',
              keyboadType: TextInputType.number,
              controller: phoneController,
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {
                dotenv.load();
                String phone = phoneController.text.trim();
                if (network == null || network!.isEmpty) {
                  showGetSnackBar(message: 'Select network provider');
                } else if (plan == null || plan!.isEmpty) {
                  showGetSnackBar(message: 'Select bundle');
                } else if (phone.isEmpty) {
                  showGetSnackBar(message: 'Enter mobile number to be top_up');
                } else {
                  _dataController.buyData(
                    DataRequest(
                        agentReference: getReference(7),
                        agentId: '${dotenv.env['agentId']}',
                        datacode: _dataController.originalPlan[index].datacode,
                        serviceType: network!.toLowerCase(),
                        amount: _dataController.originalPlan[index].price,
                        phone: phone),
                    context,
                  );
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
            )
          ],
        ),
      ),
    );
  }
}
