import 'package:flutter/material.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    Key? key,
    required this.title,
    required this.hint,
    required this.dropList,
  }) : super(key: key);

  final String title;
  final String hint;
  List<String>? dropList;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selection;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        const SizedBox(
          height: 12,
        ),
        DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(widget.hint),
            padding: const EdgeInsets.all(15),
            borderRadius: BorderRadius.circular(5),
            itemHeight: 56,
            isExpanded: true,
            border: const BorderSide(color: Colors.black87, width: 1),
            dropdownButtonColor: Colors.white,
            value: selection,
            onChanged: (newValue) {
              setState(() {
                selection = newValue as String;
              });
              debugPrint(newValue.toString());
            },
            items: widget.dropList!
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
