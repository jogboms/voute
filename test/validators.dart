import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voute/utils/mk_validators.dart';

class FakeFormFieldState extends FormFieldState<String> {
  FakeFormFieldState(String value) {
    setValue(value);
  }
}

void main() {
  test('MkValidate.tryPhone()', () {
    final validator = MkValidate.tryPhone();

    expect(validator(""), isNotNull);
    expect(validator("080651752831"), isNotNull);
    expect(validator("0107095394"), isNotNull);
    expect(validator("0807095394"), isNotNull);
    expect(validator("0907095394"), isNotNull);
    expect(validator("0607095394"), isNotNull);
    expect(validator("0707095394"), isNotNull);
    expect(validator("027095394"), isNotNull);
    expect(validator("037095394"), isNotNull);
    expect(validator("00165175283"), isNotNull);
    expect(validator("01165175283"), isNotNull);
    expect(validator("06065175283"), isNotNull);
    expect(validator("06065a75283"), isNotNull);
    expect(validator("18065275283"), isNotNull);
    expect(validator("90652752831"), isNotNull);
    expect(validator("9065275283"), isNotNull);
    expect(validator("8065275283"), isNotNull);
    expect(validator("7065275283"), isNotNull);

    expect(validator("017095394"), isNull);
    expect(validator("07065175283"), isNull);
    expect(validator("07165175283"), isNull);
    expect(validator("08065175283"), isNull);
    expect(validator("08165175283"), isNull);
    expect(validator("09065175283"), isNull);
    expect(validator("09165175283"), isNull);
  });

  test('MkValidate.tryList()', () {
    final validator = MkValidate.tryList();

    expect(validator(null), isNotNull);
    expect(validator(<dynamic>[]), isNotNull);

    expect(validator(<dynamic>[""]), isNull);
  });

  test('MkValidate.tryEmail()', () {
    final validator = MkValidate.tryEmail();

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("e.3"), isNotNull);
    expect(validator("1.3"), isNotNull);

    expect(validator("j@g.m"), isNull);
  });

  test('MkValidate.tryDiffPassword()', () {
    const password = "value";
    final validator = MkValidate.tryDiffPassword(FakeFormFieldState(password));

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("e.3"), isNotNull);
    expect(validator("1.3"), isNotNull);

    expect(validator(password), isNull);
  });

  test('MkValidate.tryDouble()', () {
    final validator = MkValidate.tryDouble();

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("e.3"), isNotNull);

    expect(validator("1.3"), isNull);
    expect(validator("0107095394"), isNull);
  });

  test('MkValidate.tryInt()', () {
    final validator = MkValidate.tryInt();

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("1.3"), isNotNull);
    expect(validator("e.3"), isNotNull);

    expect(validator("13"), isNull);
    expect(validator("0107095394"), isNull);
  });

  test('MkValidate.tryPassword()', () {
    final validator = MkValidate.tryPassword();

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("13"), isNotNull);
    expect(validator("0107095394"), isNull);

    expect(validator("10000..30"), isNull);
    expect(validator("10,000.30"), isNull);
    expect(validator("stalin"), isNull);
    expect(validator("pallindrome"), isNull);
    expect(validator("passme"), isNull);
    expect(validator("p4ssme"), isNull);
    expect(validator("passm3"), isNull);
    expect(validator("p4ssword"), isNull);
    expect(validator("passw0rd"), isNull);
  });

  test('MkValidate.tryAmount()', () {
    final validator = MkValidate.tryAmount();

    expect(validator(""), isNotNull);
    expect(validator("0"), isNotNull);
    expect(validator("10000..30"), isNotNull);
    expect(validator("10,000.30"), isNotNull);
    expect(validator("e.3"), isNotNull);

    expect(validator("1.3"), isNull);
    expect(validator("0107095394"), isNull);
    expect(validator("1.30"), isNull);
    expect(validator("10000.30"), isNull);
    expect(validator("13"), isNull);
  });
}
