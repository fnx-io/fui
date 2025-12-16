import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';

sealed class Action {
  Label get label;
  bool get isDisabled;

  get icon => label.icon;
  get text => label.text;
}

class ButtonAction extends Action {
  @override
  final Label label;
  final EventCallback? onClick;

  @override
  bool get isDisabled => onClick == null;

  ButtonAction({required String text, Component? icon, this.onClick}) : label = Label(text: text, icon: icon);

  ButtonAction.fromLabel({required this.label, this.onClick});
}

class GroupAction extends Action {
  @override
  final Label label;

  final List<Action> children;

  @override
  bool get isDisabled => children.isEmpty;

  GroupAction({required String text, Component? icon, required this.children}) : label = Label(text: text, icon: icon);

  GroupAction.fromLabel({required this.label, required this.children});
}
