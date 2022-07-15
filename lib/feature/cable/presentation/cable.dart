import 'dart:math';

import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:baxi_app/feature/cable/controller/cable_controller.dart';
import 'package:baxi_app/feature/cable/data/model/available_option.dart';
import 'package:baxi_app/feature/cable/data/model/cable_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';

import '../../../constant/widget/input_field.dart';

class Cable extends StatefulWidget {
  const Cable({Key? key}) : super(key: key);

  @override
  State<Cable> createState() => _CableState();
}

class _CableState extends State<Cable> {
  final CableController _cableController = Get.find();
  TextEditingController cardController = TextEditingController();
  bool check = true;
  String? options;
  String? pricingOptions;
  int index = 0;
  int indexPrice = 0;
  List<String> listPrice = [];
  bool editCardNo = true;

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
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
              hint: '000*********',
              title: 'Card number',
              keyboadType: TextInputType.number,
              controller: cardController,
              enable: editCardNo,
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(
              () => InputTextField(
                hint: _cableController.name.value.isEmpty
                    ? 'Auto populate'
                    : _cableController.name.value,
                title: 'Card holder name',
                keyboadType: TextInputType.number,
                enable: false,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Visibility(
              visible: check,
              child: ElevatedButton(
                onPressed: () async {
                  var cardNo = cardController.text.trim();
                  if (cardNo.isEmpty) {
                    showGetSnackBar(message: 'Enter DSTV card number');
                  } else if (cardNo.length != 10) {
                    showGetSnackBar(
                        message: 'Invalid card number (10 digits expected)');
                  } else {
                    Map<String, dynamic> params = {
                      "account_number": cardNo,
                      "service_type": 'dstv',
                    };
                    await _cableController.validateCard(params, context);
                    editCardNo = false;

                    setState(() {
                      _cableController.name.value.isNotEmpty
                          ? check = false
                          : check = true;
                    });
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber)),
                child: SizedBox(
                  width: size.width,
                  height: 48,
                  child: const Center(
                    child: Text('Validate Card'),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !check,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Packages',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
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
                        border:
                            const BorderSide(color: Colors.black87, width: 1),
                        dropdownButtonColor: Colors.white,
                        value: options,
                        onChanged: (newValue) {
                          setState(() {
                            options = newValue as String;
                            index = _cableController.listOfOptions
                                .indexOf(newValue);
                            dynamic pricing = _cableController
                                .listOfPackages[index].availablePricingOptions;
                            listPrice.clear();
                            pricingOptions = null;
                            for (AvailablePricingOptions availablePricingOptions
                                in pricing) {
                              listPrice.add(
                                '${(availablePricingOptions.monthsPaidFor)}month(s) @ NGN${availablePricingOptions.price}',
                              );
                            }
                          });
                        },
                        items: _cableController.listOfOptions
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
                  const Text(
                    'Pricing Options',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DropdownButtonHideUnderline(
                    child: GFDropdown(
                      hint: const Text('Select plans'),
                      padding: const EdgeInsets.all(15),
                      borderRadius: BorderRadius.circular(5),
                      itemHeight: 56,
                      isExpanded: true,
                      border: const BorderSide(color: Colors.black87, width: 1),
                      dropdownButtonColor: Colors.white,
                      value: pricingOptions,
                      onChanged: (newValue) {
                        setState(() {
                          pricingOptions = newValue as String;
                          indexPrice =
                              _cableController.listOfOptions.indexOf(newValue);
                        });
                      },
                      items: listPrice
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
                    onPressed: () async {
                      dotenv.load();
                      if (pricingOptions == null || pricingOptions!.isEmpty) {
                        showGetSnackBar(message: 'Select a package plan');
                      } else {
                        // String amount = pricingOptions.
                        CableRequest cableRequest = CableRequest(
                            totalAmount: '10000',
                            productMonthsPaidFor: _cableController
                                .user.value.rawOutput!.invoicePeriod
                                .toString(),
                            productCode: '0',
                            serviceType: 'dstv',
                            agentId: dotenv.env['agentId'].toString(),
                            agentReference: getRandomString(7),
                            smartcardNumber:
                                cardController.text.trim().toString());
                        _cableController.buyCable(cableRequest, context);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber)),
                    child: SizedBox(
                      width: size.width,
                      height: 48,
                      child: const Center(
                        child: Text('Buy Cable'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
