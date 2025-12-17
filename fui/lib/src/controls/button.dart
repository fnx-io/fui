import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

class Button extends StatelessComponent {
  final Action action;
  final String classes;
  final Variant variant;

  const Button(this.action, {super.key, this.classes = '', this.variant = Variant.light});

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
        ...Label.buildLabel(g.label),
        span(
          [Icons.moreDots()],
          classes: " ml-1 pl-2 mr-[2px] border-divider border-l fui-icon ",
        ),
      ],
      labelClasses: "${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes",
      dropdown: [
        VerticalMenu(items: g.children),
      ],
      dropdownClasses: " ml-2 mt-2 min-w-80 max-w-120 ${FuiStyles.dropDownShape} ",
    );
  }

  static Component _renderLink(BuildContext context, LinkAction b, String classes) {
    return a(
      [
        ...Label.buildLabel(b.label),
      ],
      href: b.href ?? '',
      classes: "${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes",
    );
  }

  static Component _renderButton(BuildContext context, ButtonAction b, String classes) {
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      classes: "${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }

  static Component _renderDisabled(BuildContext context, Action action, String classes) {
    return span(
      [
        ...Label.buildLabel(action.label),
      ],
      classes: " ${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes disabled ",
    );
  }
}
