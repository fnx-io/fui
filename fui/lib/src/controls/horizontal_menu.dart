import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

class HorizontalMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  const HorizontalMenu({super.key, required this.items, this.classes = ''});

  @override
  Component build(BuildContext context) {
    // Basic skeleton only; implementation will be added later
    return ul(
      classes:
          " relative list-none inline-flex items-center align-middle divide-x divide-divider ${FuiStyles.buttonShape}$classes",
      items.map((item) => li(classes: " inline ", [_buildItem(context, item)])).toList(),
    );
  }

  Component _buildItem(BuildContext context, Action action) {
    return switch (action) {
      ButtonAction() => _renderButton(context, action),
      GroupAction() => _renderGroup(context, action),
    };
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
      labelClasses: "inline-flex ${FuiStyles.labelParent} ",
      dropdown: [
        VerticalMenu(items: action.children),
      ],
      dropdownClasses: " ml-2 mt-2 ${FuiStyles.dropDownShape} ",
    );
  }

  Component _renderButton(BuildContext context, Action action) {
    final b = action as ButtonAction;
    return button(
      [
        ...Label.buildLabel(b.label),
      ],
      disabled: b.onClick != null,
      classes: "inline-flex ${FuiStyles.labelParent} $classes",
      events: {
        if (b.onClick != null) "onClick": b.onClick!,
      },
    );
  }
}
