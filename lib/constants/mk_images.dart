import 'package:flutter/widgets.dart';

class MkImages {
  MkImages._();

  static const List<ImageProvider> cards = [
    maestroLogo,
    mastercardLogo,
    visaPayLogo,
  ];

  static const ImageProvider logo = AssetImage('assets/images/logo.png');
  static const ImageProvider maestroLogo =
      AssetImage('assets/images/maestro-logo.png');
  static const ImageProvider mastercardLogo =
      AssetImage('assets/images/mastercard-logo.png');
  static const ImageProvider visaPayLogo =
      AssetImage('assets/images/visa-pay-logo.png');
}
