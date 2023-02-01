import 'package:flutter/material.dart';
import 'package:infi_devtest/services/service_locator.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = const Color(0xff11D0A2),
  }) : super(key: key);
  final void Function() onTap;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizeConfig.getPropWidth(327),
        height: sizeConfig.getPropHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
