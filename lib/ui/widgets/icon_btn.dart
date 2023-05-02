import 'package:flutter/material.dart';

class IconBTN extends StatelessWidget {
  final IconData icon;
  final Color mainColor;
  final Color activeColor;
  final bool isBackground;
  final bool isActive;
  final Function() action;
  const IconBTN({
    super.key,
    this.icon = Icons.abc,
    this.mainColor = Colors.black,
    this.activeColor = Colors.black,
    this.isBackground = false,
    this.isActive = false,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: isBackground == true
          ? ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(activeColor),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          : null,
      padding: const EdgeInsets.all(16),
      icon: Icon(
        icon,
        color: isActive == true ? activeColor : mainColor,
      ),
      onPressed: action,
    );
  }
}
