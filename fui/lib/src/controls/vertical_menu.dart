import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

class VerticalMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  const VerticalMenu({super.key, required this.items, this.classes = ''});

  @override
  Component build(BuildContext context) {
    // Basic skeleton only; implementation will be added later
    return ul(
      classes: "space-y-1 $classes",
      items.map((item) => li([_buildItem(context, item)])).toList(),
    );
  }

  Component _buildItem(BuildContext context, Action action) {
    return switch (action) {
      Action(isDisabled: true) => _renderDisabled(context, action),
      ButtonAction() => _renderButton(context, action),
      GroupAction() => _renderGroup(context, action),
    };
  }

  static Component _renderGroup(BuildContext context, GroupAction g) {
    return details(
      classes: "fui-menu_detail",
      [
        summary(
          [
            ...Label.buildLabel(g.label),
            span([Icons.moreChevron()], classes: "fui-icon ml-1 "),
          ],
          classes: ' inline-flex w-full ${FuiStyles.labelParent} cursor-pointer rounded-l hover:bg-light ',
        ),
        VerticalMenu(items: g.children, classes: 'ml-7'),
      ],
    );
  }

  static Component _renderButton(BuildContext context, ButtonAction b) {
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      disabled: b.onClick != null,
      classes: "inline-flex ${FuiStyles.labelParent}",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }

  static Component _renderDisabled(BuildContext context, Action action) {
    return span(
      [
        ...Label.buildLabel(action.label),
      ],
      classes: " inline-flex ${FuiStyles.labelParent} disabled ",
    );
  }
}
