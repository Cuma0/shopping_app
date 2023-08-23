import 'package:flutter/material.dart';

import '../../utils/color_scheme.dart';
import '../../utils/context_extensions.dart';

SizedBox circleButtonWidget(
    {required BuildContext context,
    required void Function()? onPressed,
    required Icon icon,
    Color? backgroundColor}) {
  return SizedBox(
    height: context.mediumValue * 1.5,
    width: context.mediumValue * 1.5,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
            backgroundColor ?? ColorSchemeLight.instance!.lightGrey,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
      ),
      child: icon,
    ),
  );
}
