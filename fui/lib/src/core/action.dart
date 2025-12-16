import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_styles.dart';
import 'package:jaspr/jaspr.dart';

sealed class Action {
  Label get label;
  List<Action> get children;
  bool get isDisabled;

  get icon => label.icon;
  get text => label.text;

  Component render(String classes, DisplayBase display, {List<Component>? extraContent});
}

class ButtonAction extends Action {
  @override
  final Label label;
  final EventCallback? onClick;

  @override
  bool get isDisabled => onClick == null;

  ButtonAction({required String text, Component? icon, this.onClick}) : label = Label(text: text, icon: icon);

  ButtonAction.fromLabel({required this.label, this.onClick});

  @override
  Component render(String classes, DisplayBase display, {List<Component>? extraContent}) {
    return button(
      [
        ...Label.buildLabel(label),
        if (extraContent != null) ...extraContent,
      ],
      disabled: isDisabled,
      classes: "${display.asFlex()}${FuiStyles.labelParent} $classes",
      events: {
        if (onClick != null) "onClick": onClick!,
      },
    );
  }

  @override
  List<Action> get children => const [];

  //span([Icons.moreDots()], classes: "fui-label-icon ml-1 pl-2 mr-[2px] border-divider border-l"),
}

class GroupAction extends Action {
  @override
  final Label label;
  @override
  final List<Action> children;

  @override
  bool get isDisabled => children.isEmpty;

  GroupAction({required String text, Component? icon, required this.children}) : label = Label(text: text, icon: icon);

  GroupAction.fromLabel({required this.label, required this.children});

  @override
  Component render(String classes, DisplayBase display, {List<Component>? extraContent}) {
    return button(
      [
        ...Label.buildLabel(label),
        if (extraContent != null) ...extraContent,
      ],
      classes: " ${isDisabled ? 'disabled' : ''} ${display.asFlex()}${FuiStyles.labelParent} relative $classes",
      attributes: {
        "tabindex": "0",
      },
    );
  }
}
