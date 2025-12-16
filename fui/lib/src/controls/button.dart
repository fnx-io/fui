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
      ButtonAction() => _renderButton(context),
      GroupAction() => _renderGroup(context),
    };
  }

  Component _renderGroup(BuildContext context) {
    final g = action as GroupAction;
    return Dropdown(
      label: [
        ...Label.buildLabel(g.label),
        span(
          [Icons.moreDots()],
          classes: "ml-1 pl-2 mr-[2px] border-divider border-l fui-icon ",
        ),
      ],
      labelClasses: "inline-flex ${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes",
      dropdown: [
        VerticalMenu(items: action.children),
      ],
      dropdownClasses: " ml-2 mt-2 ${FuiStyles.dropDownShape} ",
    );
  }

  Component _renderButton(BuildContext context) {
    final b = action as ButtonAction;
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      disabled: b.onClick != null,
      classes: "inline-flex ${FuiStyles.labelParent} ${FuiStyles.buttonShape} $classes",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }
}
