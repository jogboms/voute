// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voute/constants/mk_fonts.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_screen_util.dart';

/// The TextStyles and Colors used for titles, labels, and descriptions. This
/// InheritedWidget is shared by all of the routes and widgets created for
/// the Mk app.
class AppTheme extends InheritedWidget {
  const AppTheme({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  TextStyle get xxsmall => _text10Style;
  TextStyle get small => _text12Style;
  TextStyle get smallMedium => small.copyWith(fontWeight: MkStyle.medium);
  TextStyle get body1 => _text13Style;
  TextStyle get body2 => body1.copyWith(height: 1.5);
  TextStyle get body3Medium => _text14MediumStyle;
  TextStyle get body3MediumHint => body3Medium.copyWith(color: Colors.grey);
  TextStyle get bodyMedium => body1.copyWith(fontWeight: MkStyle.medium);

  TextStyle get buttonFlat => _text15Style;
  TextStyle get button => buttonFlat.copyWith(fontWeight: MkStyle.semibold);

  TextStyle get textfield => _text15Style;
  TextStyle get textfieldLabel => textfield.copyWith(color: const Color(0xFFB2B2B2));

  TextStyle get title => _header18Style;
  TextStyle get subhead1 => _text15Style;
  TextStyle get subhead1Medium => subhead1.copyWith(fontWeight: MkStyle.medium);
  TextStyle get subhead3 => _text16Style;
  TextStyle get subhead3Semi => subhead3.copyWith(fontWeight: MkStyle.semibold);
  TextStyle get subhead4 => _text18Style;
  TextStyle get subhead4Medium => subhead4.copyWith(fontWeight: MkStyle.medium);
  TextStyle get display1 => _text20Style;
  TextStyle get appBarTitle => display1.copyWith(fontWeight: MkStyle.medium, letterSpacing: 1.75);

  TextStyle get errorStyle => small.copyWith(color: kBorderSideErrorColor);

  TextStyle get _header18Style => mkFontMedium(18.0);

  TextStyle get _text10Style => mkFontRegular(10.0);
  TextStyle get _text12Style => mkFontRegular(12.0);
  TextStyle get _text13Style => mkFontRegular(13.0);
  TextStyle get _text14MediumStyle => mkFontMedium(14.0);
  TextStyle get _text15Style => mkFontRegular(15.0);
  TextStyle get _text16Style => mkFontRegular(16.0);
  TextStyle get _text18Style => mkFontRegular(18.0);
  TextStyle get _text20Style => mkFontRegular(20.0);

  static AppTheme of(BuildContext context) => context.inheritFromWidgetOfExactType(AppTheme);

  ThemeData themeData(ThemeData theme) {
    return ThemeData(
      accentColor: kAccentColor,
      primarySwatch: kPrimarySwatch,
      primaryColor: kPrimaryColor,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: kPrimarySwatch),
      textTheme: theme.textTheme.copyWith(
        body1: theme.textTheme.body1.merge(body1),
        button: theme.textTheme.button.merge(button),
      ),
      canvasColor: Colors.white,
      buttonTheme: theme.buttonTheme.copyWith(height: kButtonHeight, padding: EdgeInsets.symmetric(vertical: sh(8))),
      iconTheme: theme.iconTheme.copyWith(size: sf(22)),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        isDense: false,
        focusedBorder: _kTextFieldBorder,
        enabledBorder: _kTextFieldBorder,
        errorBorder: _kTextFieldBorder,
        border: _kTextFieldBorder,
        contentPadding: EdgeInsets.only(left: sw(20), right: sw(10), top: sh(12), bottom: sh(12)),
        hintStyle: textfieldLabel,
        labelStyle: textfieldLabel,
        errorStyle: errorStyle,
      ),
      cursorColor: kPrimaryColor,
      fontFamily: MkFonts.base,
      hintColor: kHintColor,
      dividerColor: kBorderSideColor,
    );
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => false;
}

const _kTextFieldBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(Radius.circular(25)),
);
