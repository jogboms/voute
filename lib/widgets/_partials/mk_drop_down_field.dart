import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/widgets/_partials/mk_drop_down.dart';

class MkDropDownField extends StatelessWidget {
  const MkDropDownField({
    Key key,
    this.hint,
    @required this.items,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.autovalidate = false,
    this.enabled = true,
    this.onChanged,
    this.style,
    this.isExpanded,
    this.decoration = const InputDecoration(),
  })  : assert(decoration != null),
        super(key: key);

  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String initialValue;
  final bool autovalidate;
  final bool enabled;
  final String hint;
  final List<String> items;
  final FormFieldSetter<String> onChanged;
  final bool isExpanded;
  final InputDecoration decoration;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue:
          initialValue != null && initialValue.isNotEmpty ? initialValue : null,
      autovalidate: autovalidate,
      builder: (FormFieldState<String> field) {
        final effectiveDecoration = decoration
            .applyDefaults(Theme.of(context).inputDecorationTheme)
            .copyWith(errorText: field.errorText);

        final child = MkDropDown(
          hint: hint,
          hintStyle: decoration.hintStyle,
          value: field.value,
          items: items,
          style: style,
          onChanged: (String value) {
            field.didChange(value);
            if (onChanged != null) {
              onChanged(value);
            }
          },
          isExpanded: isExpanded,
        );

        final contentPadding = effectiveDecoration.contentPadding as EdgeInsets;

        return InputDecorator(
          decoration: effectiveDecoration.copyWith(
            contentPadding: contentPadding.copyWith(
              left: sw(4),
            ),
          ),
          isEmpty: field.value == null,
          child: IgnorePointer(
            ignoring: !enabled,
            child: child,
          ),
        );
      },
      validator: validator,
      onSaved: onSaved,
    );
  }
}
