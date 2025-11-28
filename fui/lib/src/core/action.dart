import 'package:fui/src/core/fui_icons.dart';
import 'package:jaspr/jaspr.dart';

import 'label.dart';

class Action extends StatelessComponent {
  final Label label;
  final EventCallback? onClick;
  final List<Action> children;

  Action({super.key, required String text, Component? icon, this.onClick, this.children = const []})
    : label = Label(text: text, icon: icon) {
    // cannot have onClick and children at the same time
    if (onClick != null) {
      assert(children.isEmpty, 'Action cannot have both onClick and children at the same time');
    }
  }

  Action.fromLabel({super.key, required this.label, this.onClick, this.children = const []}) {
    // cannot have onClick and children at the same time
    if (onClick != null) {
      assert(children.isEmpty, 'Action cannot have both onClick and children at the same time');
    }
  }

  get icon => label.icon;
  get text => label.text;

  bool get isDisabled => onClick == null && children.isEmpty;

  @override
  Component build(BuildContext context) {
    return span(
      buildAction(this),
      events: {
        if (onClick != null) "onClick": onClick!,
      },
    );
  }

  static List<Component> buildAction(Action action) {
    return [
      ...Label.buildLabel(action.label),
      if (action.children.isNotEmpty) // more icon:
        span([FuiIcons.moreDots()], classes: "fui-label-icon ml-1 pl-2 mr-[2px] border-divider border-l"),
    ];
  }
}
