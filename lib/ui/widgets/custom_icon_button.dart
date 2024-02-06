import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  final bool isLoading;
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
        side: BorderSide(
          color: borderColor,
        ),
      ),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: isLoading
              ? const CupertinoActivityIndicator(radius: 12)
              : Icon(
                  iconData,
                  color: iconColor,
                ),
        ),
      ),
    );
  }
}
