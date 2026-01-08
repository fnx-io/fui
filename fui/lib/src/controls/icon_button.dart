import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

/// Renders an [Action] as an icon button. Underlaying HTML element depends on the type of action, it might be a
/// button, link, or dropdown menu, however the visual appearance is always that of an icon.
///
class IconButton extends StatelessComponent {
  final Action action;
  final String classes;
  final Variant variant;

  static const String _classes = "size-9 p-2 inline-block text-center cursor-pointer hover:bg-light rounded-full";

  const IconButton(this.action, {super.key, this.classes = '', this.variant = Variant.light});

  @override
  Component build(BuildContext context) {
    return switch (action) {
      Action(isDisabled: true) => _renderDisabled(context, action, classes),
      ButtonAction() => _renderButton(context, action as ButtonAction, classes),
      GroupAction() => _renderGroup(context, action as GroupAction, classes),
      LinkAction() => _renderLink(context, action as LinkAction, classes),
    };
  }

  static Component _renderGroup(BuildContext context, GroupAction g, String classes) {
    return Dropdown(
      label: [
        span(
          [Icons.moreDots()],
          classes: " fui-icon ",
        ),
      ],
      labelClasses: "$_classes $classes",
      dropdown: [
        VerticalMenu(items: g.children),
      ],
      dropdownClasses: " ml-2 mt-2 min-w-80 max-w-120 ${FuiStyles.dropDownShape} ",
    );
  }

  static Component _renderLink(BuildContext context, LinkAction b, String classes) {
    return a(
      [
        ...Label.buildIcon(b.label),
      ],
      href: b.href ?? '',
      target: b.target,
      classes: "$_classes $classes",
    );
  }

  static Component _renderButton(BuildContext context, ButtonAction b, String classes) {
    return button(
      [
        ...Label.buildIcon(b.label),
      ],
      classes: "$_classes $classes",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }

  static Component _renderDisabled(BuildContext context, Action action, String classes) {
    return span(
      [
        ...Label.buildIcon(action.label),
      ],
      classes: "$_classes $classes disabled ",
    );
  }
}
