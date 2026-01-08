import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

/// Renders a horizontal menu (a "bar" of buttons) from a list of [Action]s.
///
class HorizontalMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  const HorizontalMenu({super.key, required this.items, this.classes = ''});

  @override
  Component build(BuildContext context) {
    return ul(
      classes:
          " relative list-none inline-flex items-center align-middle divide-x divide-divider ${FuiStyles.buttonShape} $classes",
      items.map((item) => li(classes: " inline ", [_buildItem(context, item)])).toList(),
    );
  }

  Component _buildItem(BuildContext context, Action action) {
    return switch (action) {
      Action(isDisabled: true) => _renderDisabled(context, action, classes),
      ButtonAction() => _renderButton(context, action),
      GroupAction() => _renderGroup(context, action),
      LinkAction() => _renderLink(context, action),
    };
  }

  static Component _renderDisabled(BuildContext context, Action action, String classes) {
    return span(
      [
        ...Label.buildLabel(action.label),
      ],
      classes: " ${FuiStyles.labelParent} $classes disabled ",
    );
  }

  Component _renderGroup(BuildContext context, Action action) {
    final g = action as GroupAction;
    return Dropdown(
      label: [
        ...Label.buildLabel(g.label),
        span(
          [Icons.moreDots()],
          classes: "ml-1 pl-2 mr-[2px] border-divider border-l fui-icon ",
        ),
      ],
      labelClasses: " ${FuiStyles.labelParent} ",
      dropdown: [
        VerticalMenu(items: action.children),
      ],
      dropdownClasses: " ml-2 mt-2 min-w-80 max-w-120 ${FuiStyles.dropDownShape} ",
    );
  }

  static Component _renderButton(BuildContext context, ButtonAction b) {
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      classes: " ${FuiStyles.labelParent} ",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }

  static Component _renderLink(BuildContext context, LinkAction l) {
    return a(
      [
        ...Label.buildLabel(l.label),
      ],
      href: l.href ?? "#",
      target: l.target,
      classes: " ${FuiStyles.labelParent} ",
    );
  }
}
