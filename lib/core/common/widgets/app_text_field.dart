import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.hintText,
    super.key,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.onEditingComplete,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.autofillHints,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;
  final VoidCallback? onEditingComplete;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return _buildCupertinoTextField(context);
    }
    return _buildMaterialTextField(context);
  }

  Widget _buildMaterialTextField(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      style: context.textStyles.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: context.colors.containerBackground.withValues(alpha: 0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colors.textSecondary.withValues(alpha: 0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colors.mainColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colors.error,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              labelText!,
              style: context.textStyles.labelMedium,
            ),
          ),
        ],
        CupertinoTextFormFieldRow(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          placeholder: hintText,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          prefix: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: prefixIcon,
                )
              : null,
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6.resolveFrom(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CupertinoColors.systemGrey4.resolveFrom(context),
            ),
          ),
        ),
      ],
    );
  }
}
