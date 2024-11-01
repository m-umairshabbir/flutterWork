import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.text,
      required this.controller,
      required this.hintText,
      this.onTap,
      this.maxLines = 1,
      this.enabled = true,
      this.obscureText = false,
      this.textInputType,
      this.maxLength});
  final String? text;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final bool enabled;
  final VoidCallback? onTap;
  final TextInputType? textInputType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text == null
            ? const SizedBox.shrink()
            : Column(
                children: [
                  Text(
                    text!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primaryLightColor,
          ),
          height: maxLines == 3 ? 90 : 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            onTap: onTap,

            obscureText: obscureText,
            maxLines: maxLines,
            enabled: enabled,

            keyboardType: textInputType,
            inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
            // maxLength: maxLength,
            // maxLengthEnforcement: MaxLengthEnforcement.none,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        )
      ],
    ));
  }
}
