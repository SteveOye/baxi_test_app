import 'package:flutter/material.dart';

class GridItems extends StatelessWidget {
  const GridItems({
    Key? key,
    required this.size,
    required this.action,
    required this.color,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  final Size size;
  final Function() action;
  final Color color;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(iconData),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
