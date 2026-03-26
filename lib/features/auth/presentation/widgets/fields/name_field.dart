import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_text_field.dart';
import 'package:notiva/core/utils/app_validators.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';

class NameField extends StatelessWidget {
  const NameField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: context.l10n.fullName,
      prefixIcon: const Icon(Icons.person_outline),
      autofillHints: const [AutofillHints.name],
      validator: (v) => AppValidators.name(context, v),
    );
  }
}
