import 'package:intl/intl.dart';

String _symbol = String.fromCharCodes(Runes('\u20A6'));

class MkMoney {
  MkMoney(this.money, {bool isLong = false, int decimalDigits = 2})
      : _nfmt = isLong
            ? NumberFormat.currency(
                symbol: _symbol,
                decimalDigits: decimalDigits,
              )
            : NumberFormat.compactCurrency(
                symbol: _symbol,
                decimalDigits: decimalDigits,
              );

  num money;
  NumberFormat _nfmt;

  String get format {
    try {
      return _nfmt.format(money ?? 0);
    } catch (e) {
      return "${_symbol}0.0";
    }
  }
}
