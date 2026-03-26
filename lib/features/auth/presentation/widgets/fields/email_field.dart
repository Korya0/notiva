import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notiva/core/common/widgets/app_text_field.dart';
import 'package:notiva/core/utils/app_validators.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: context.l10n.email,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      prefixIcon: const Icon(Icons.email_outlined),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[\u0600-\u06FF]')),
      ],
      validator: (v) => AppValidators.email(context, v),
    );
  }
}
