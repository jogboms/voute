import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

// NOTE: needs more love
class MkMoneyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write(',');
      }
    }

    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

// NOTE: needs more love
class MkCurrencyFormatter extends WhitelistingTextInputFormatter {
  MkCurrencyFormatter() : super(RegExp("[0-9\.]"));

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newerValue = super.formatEditUpdate(oldValue, newValue);

    print(newerValue);
    if (newerValue.selection.baseOffset == 0) {
      return newerValue;
    }

    final double value = double.tryParse(newerValue.text) ?? 0;

    final newText = NumberFormat("###,###.##").format(value);
    print([value, newText]);

    final extra = ","
        .allMatches(newText.substring(0, newerValue.selection.baseOffset))
        .length;

    return newerValue.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(TextPosition(
        affinity: newerValue.selection.affinity,
        offset: newerValue.selection.baseOffset + extra,
      )),
    );
  }
}
