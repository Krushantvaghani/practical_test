import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double padding;
  final double radius;
  final Function()? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? iconColor;
  final double? iconSize;
  final IconData? icon;
  final double? width;
  final Border? border;
  final bool? enable;
  final Widget? suffixIcon;

  const CustomButton({
    Key? key,
    this.title,
    this.padding = 15,
    this.radius = 10,
    this.onTap,
    this.style,
    this.color,
    this.icon,
    this.iconColor,
    this.iconSize = 25,
    this.width,
    this.border,
    this.enable = true,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(),
    );
  }
}
