import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

/// Renders a vertical menu (a "list" of buttons) from a list of [Action]s. It's used to render dropdown menus and sidebars.
/// Note: Your can combine different Action types within the same menu - [ButtonAction]s, [LinkAction]s, and [GroupAction]s can all be used together.
///
class VerticalMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  static const _itemClasses = " w-full cursor-pointer hover:bg-light text-left ";

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
      LinkAction() => _renderLink(context, action),
      GroupAction() => _renderGroup(context, action),
    };
  }

  static Component _renderDisabled(BuildContext context, Action action) {
    return span(
      [
        ...Label.buildLabel(action.label),
      ],
      classes: " ${FuiStyles.labelParent} disabled ",
    );
  }

  static Component _renderButton(BuildContext context, ButtonAction b) {
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      classes: "${FuiStyles.labelParent} $_itemClasses",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }

  static Component _renderLink(BuildContext context, LinkAction b) {
    return a(
      [
        ...Label.buildLabel(b.label),
      ],
      href: b.href ?? '#',
      classes: "${FuiStyles.labelParent} $_itemClasses ",
    );
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
          classes: ' ${FuiStyles.labelParent} $_itemClasses',
        ),
        VerticalMenu(items: g.children, classes: 'ml-7'),
      ],
    );
  }
}
