import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notiva/core/common/widgets/app_text_field.dart';
import 'package:notiva/core/utils/app_validators.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _pv = false;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      hintText: context.l10n.password,
      obscureText: !_pv,
      prefixIcon: const Icon(Icons.lock_outline),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[\u0600-\u06FF]')),
      ],
      suffixIcon: IconButton(
        icon: Icon(
          _pv ? Icons.visibility_off : Icons.visibility,
          size: 20,
        ),
        onPressed: () => setState(() => _pv = !_pv),
      ),
      validator: (v) => AppValidators.password(context, v),
    );
  }
}
