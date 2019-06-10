import 'package:flutter/material.dart';
import 'package:voute/utils/mk_theme.dart';

class MkDropDown extends StatefulWidget {
  const MkDropDown({
    Key key,
    this.hint,
    this.value,
    @required this.items,
    @required this.onChanged,
    this.isExpanded,
    this.style,
    this.hintStyle,
  }) : super(key: key);

  final String hint;
  final String value;
  final List<String> items;
  final FormFieldSetter<String> onChanged;
  final bool isExpanded;
  final TextStyle style;
  final TextStyle hintStyle;

  @override
  MkDropDownState createState() => MkDropDownState();
}

class MkDropDownState extends State<MkDropDown> {
  String _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(MkDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = MkTheme.of(context),
        _textStyle = _theme.subhead1Medium,
        _style = _value == null
            ? (widget.hintStyle ?? widget.style ?? _theme.textfieldLabel)
            : (widget.style ?? _theme.textfield);
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        value: null,
        isExpanded: widget.isExpanded ?? true,
        hint: Text(
          _value ?? widget.hint ?? "Click here to drop down",
          style: _style,
        ),
        elevation: 1,
        items: widget.items.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: _textStyle),
            );
          },
        ).toList(),
        style: widget.style,
        iconEnabledColor: _style.color,
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (String value) {
          setState(() {
            _value = value;
            widget.onChanged(value);
          });
        },
      ),
    );
  }
}
