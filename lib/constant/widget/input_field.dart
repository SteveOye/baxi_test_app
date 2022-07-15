import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  InputTextField({
    Key? key,
    this.controller,
    required this.hint,
    this.obscure = false,
    required this.title,
    this.keyboadType = TextInputType.text,
    this.maxLines = 1,
    this.showSuffixIcon = false,
    this.errorMessage,
    this.enable = true,
    this.fillColor = Colors.white,
    this.initValue,
  }) : super(key: key);

  final String title, hint;
  final TextEditingController? controller;
  late bool obscure;
  final TextInputType keyboadType;
  final int? maxLines;
  final bool showSuffixIcon, enable;
  final String? errorMessage;
  final Color fillColor;
  final String? initValue;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
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
          height: 8,
        ),
        SizedBox(
          height: 56.0,
          child: TextFormField(
            enabled: widget.enable,
            controller: widget.controller,
            keyboardType: widget.keyboadType,
            maxLines: widget.maxLines,
            obscureText: widget.obscure,
            initialValue: widget.initValue,
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              errorStyle: const TextStyle(
                height: 0,
                fontSize: 0,
                color: Colors.transparent,
              ),
              hintText: widget.hint,
              hintStyle:
                  TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[700]),
            ),
          ),
        ),
      ],
    );
  }
}
