import 'package:flutter/material.dart';
import '../../utils/context_extensions.dart';

import '../../utils/color_scheme.dart';
import '../../utils/text_theme.dart';

Widget textFormWidget({
  required BuildContext context,
  required String hintText,
  Widget? suffixIcon,
  double? height,
}) {
  return SizedBox(
    height: height ?? context.mediumValue * 1.2,
    child: TextFormField(
      textInputAction: TextInputAction.done,
      style: TextThemeLight.instance!.titleMedium,
      cursorColor: ColorSchemeLight.instance!.black,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextThemeLight.instance!.bodyMedium
            .copyWith(fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.only(
          left: context.paddingNormal.left,
        ),
        filled: true,
        fillColor: ColorSchemeLight.instance!.lightGrey,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorSchemeLight.instance!.lightGrey,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ColorSchemeLight.instance!.lightGrey,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
    ),
  );
}
