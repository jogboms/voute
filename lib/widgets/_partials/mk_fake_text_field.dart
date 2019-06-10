import 'package:flutter/material.dart';
import 'package:voute/constants/mk_style.dart';
import 'package:voute/utils/mk_theme.dart';

class MkFakeTextField<T> extends StatelessWidget {
  const MkFakeTextField({
    Key key,
    @required this.onTap,
    this.initialValue,
    this.hint,
    this.child,
    this.icon,
    this.autovalidate = false,
    this.onSaved,
    this.padding,
    this.validator,
    this.decoration = const InputDecoration(),
  }) : super(key: key);

  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final ValueSetter<FormFieldState<T>> onTap;
  final T initialValue;
  final String hint;
  final Widget child;
  final IconData icon;
  final EdgeInsets padding;
  final bool autovalidate;
  final InputDecoration decoration;

  bool get isEnabled => onTap != null;

  @override
  Widget build(BuildContext context) {
    final _theme = MkTheme.of(context);
    return FormField<T>(
      initialValue:
          // initialValue != null && initialValue.isNotEmpty
          initialValue != null ? initialValue : null,
      autovalidate: autovalidate,
      builder: (FormFieldState<T> field) {
        final effectiveDecoration = decoration
            .applyDefaults(Theme.of(context).inputDecorationTheme)
            .copyWith(
              contentPadding: padding,
              errorText: field.errorText,
              suffixIcon: icon != null ? Icon(
                icon,
                color: kHintColor,
              ): null,
            );
        return InkWell(
          onTap: isEnabled
              ? () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onTap(field);
                }
              : null,
          child: InputDecorator(
            decoration: effectiveDecoration,
            isEmpty: field.value == null,
            child: child ??
                Text(
                  () {
                    if (field.value != null) {
                      if (field.value is List) {
                        return (field.value as List).isNotEmpty
                            ? "Successfully Added!"
                            : hint;
                      }
                      if (field.value is String) {
                        return (field.value as String).isNotEmpty
                            ? field.value.toString()
                            : hint;
                      }
                      return field.value.toString();
                    }
                    return hint;
                  }(),
                  style: () {
                    if (!isEnabled) {
                      return _theme.title;
                    }
                    if ((field.value != null &&
                            field.value is! List &&
                            field.value is! String) ||
                        (field.value is List &&
                            (field.value as List).isNotEmpty) ||
                        (field.value is String &&
                            (field.value as String).isNotEmpty)) {
                      return _theme.textfield;
                    }

                    return _theme.body3MediumHint;
                  }(),
                ),
          ),
        );
      },
      validator: validator,
      onSaved: onSaved,
    );
  }
}
