import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';

/// Action is an abstract representation of an interactive element such as a button, link, menu item, etc. The Action itself does not render anything;
/// it simply holds the data needed to render the action appropriately in different contexts. The same Action object can be used in multiple places: [VerticalMenu], [HorizontalMenu], [Button], [IconButton], etc.
///
sealed class Action {
  Label get label;
  bool get isDisabled;

  get icon => label.icon;
  get text => label.text;
}

/// A ButtonAction is defined by [Label] and it's [onClick] callback. Use it to handle internal application actions. In most cases renders as a `<button>`.
///
class ButtonAction extends Action {
  @override
  final Label label;
  final EventCallback? onClick;

  @override
  bool get isDisabled => onClick == null;

  ButtonAction({required String text, Component? icon, this.onClick}) : label = Label(text: text, icon: icon);

  ButtonAction.fromLabel({required this.label, this.onClick});
}

/// A LinkAction is defined by [Label] and its [href]. Use it to navigate to external resources. In most cases renders as an `<a>`.
///
class LinkAction extends Action {
  @override
  final Label label;

  final String? href;

  final Target? target;

  @override
  bool get isDisabled => href == null;

  LinkAction({required String text, Component? icon, required this.href, this.target})
    : label = Label(text: text, icon: icon);

  LinkAction.fromLabel({required this.label, required this.href, this.target});
}

/// A GroupAction is defined by [Label] and a list of child [Action] items. Use it to group related actions together, for example in a dropdown menu. In most cases renders as a `<detail>` with nested items.
/// You can nest GroupActions within other GroupActions to create multi-level menus. Freely mix different Action types within the children list.
///
class GroupAction extends Action {
  @override
  final Label label;

  final List<Action> children;

  @override
  bool get isDisabled => children.isEmpty;

  GroupAction({required String text, Component? icon, required this.children}) : label = Label(text: text, icon: icon);

  GroupAction.fromLabel({required this.label, required this.children});
}
