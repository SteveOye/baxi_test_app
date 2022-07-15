import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Successful',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          const Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Colors.green,
          ),
          const SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Get.back();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: const Center(
                child: Text('Okay'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
