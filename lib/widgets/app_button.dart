import 'package:cookish/utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/custom_textstyles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.onTap,
      this.text,
      this.btnColor,
      this.border,
      this.textColor,
      this.isLoading,
      this.textStyle,
      this.btnChild});
  final Function()? onTap;
  final String? text;
  final Color? btnColor, textColor;
  final bool? isLoading;
  final Widget? btnChild;
  final TextStyle? textStyle;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 57.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: border,
          color: btnColor ?? AppColors.appPrimary,
        ),
        child: Center(
          child: btnChild ??
              ((isLoading ?? false)
                  ? const CircularProgressIndicator()
                  : Text(
                      text ?? '',
                      style: textStyle ??
                          titleSmall.copyWith(
                              color: textColor ?? AppColors.white,
                              fontWeight: FontWeight.w700),
                    )),
        ),
      ),
    );
  }
}

/**Text(
            text,
            style: titleSmall.copyWith(
                color: textColor ?? AppColors.white,
                fontWeight: FontWeight.w700),
          ), */