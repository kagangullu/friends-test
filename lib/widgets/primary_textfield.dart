import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrimaryCustomTextField extends StatelessWidget {
  const PrimaryCustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.maxLength})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        validator: (value) {
          if (value == null || value.isEmpty)
            return AppLocalizations.of(context)!.required;
          return null;
        },
      ),
    );
  }
}
