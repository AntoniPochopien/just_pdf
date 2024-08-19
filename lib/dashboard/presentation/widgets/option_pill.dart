import 'package:flutter/material.dart';
import 'package:just_pdf/constants/dim.dart';

class OptionPill extends StatelessWidget {
  final Function onTap;
  final bool selected;
  final String text;
  const OptionPill(
      {super.key,
      required this.selected,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dim.optionPillPadding,
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(Dim.radius),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                border: Border.all(),
                color: selected ? Colors.black : null,
                borderRadius: BorderRadius.circular(Dim.radius)),
            child: Padding(
                padding: Dim.innerPadding,
                child: Text(
                  text,
                  style: TextStyle(color: selected ? Colors.white : null),
                ))),
      ),
    );
  }
}
