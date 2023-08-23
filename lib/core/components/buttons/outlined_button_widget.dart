import 'package:flutter/material.dart';

import '../../utils/color_scheme.dart';
import '../../utils/context_extensions.dart';
import '../../utils/text_theme.dart';

Widget outlinedButtonWidget(
    {required BuildContext context,
    required IconData icon,
    required String text}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          6,
        ),
        side: BorderSide(
          width: 1,
          color: ColorSchemeLight.instance!.mediumGrey,
        ),
      ),
      minimumSize: Size.zero,
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingLow.horizontal / 2,
        vertical: context.paddingLow.vertical / 3,
      ),
      elevation: 0,
    ),
    onPressed: () {},
    icon: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.asset(
        "assets/images/earphone.jpg",
        fit: BoxFit.cover,
        height: context.mediumValue,
        width: context.mediumValue,
      ),
    ),
    label: Text(
      text,
      style: TextThemeLight.instance!.titleMedium
          .copyWith(fontWeight: FontWeight.w500),
    ),
  );
}
