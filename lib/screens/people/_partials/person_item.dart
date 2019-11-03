import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:voute/utils/mk_screen_util.dart';
import 'package:voute/utils/mk_theme.dart';
import 'package:voute/widgets/_partials/mk_icon_button.dart';

class PersonItem extends StatelessWidget {
  const PersonItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black12,
      borderRadius: BorderRadius.circular(4),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: sh(48),
          child: Row(
            children: <Widget>[
              SizedBox(width: sh(16)),
              CircleAvatar(child: Text("A")),
              SizedBox(width: sh(16)),
              Expanded(child: Text("Agbeke", style: MkTheme.of(context).subhead1Medium)),
              MkIconButton(
                icon: FeatherIcons.moreHorizontal,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
