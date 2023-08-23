import 'package:flutter/material.dart';
import '../../utils/context_extensions.dart';

Widget squareButtonWidget({
  required BuildContext context,
  required Color buttonColor,
  required Widget child,
  required void Function()? onPressed,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: Size.zero,
     padding: context.paddingLow/2,
      elevation: 0,
      backgroundColor: buttonColor,
    ),
    onPressed: onPressed,
    child: child
  );
}
