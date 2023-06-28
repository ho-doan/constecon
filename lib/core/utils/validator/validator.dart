import 'package:flutter/material.dart';

extension Validator on String? {
  String? validatorPhone(
    BuildContext context, {
    required AutovalidateMode? autovalidateMode,
  }) {
    // if (this == null || this!.isEmpty) {
    //   return autovalidateMode == AutovalidateMode.always
    //       ? context.ln.requiredInput
    //       : null;
    // }
    // if (this!.length == 1 && this!.startsWith('0')) return null;
    // if (!this!.startsWith('0')) return context.ln.startWidth0;
    // if (this!.length != 10) return context.ln.phoneHas10Number;
    // if (!this!.isNumber) {
    //   return context.ln.phoneWithCharacter;
    // }
    return null;
  }
}
