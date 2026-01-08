import 'package:jaspr/jaspr.dart';

int _sequence = 0;

/// A dropdown component consisting of a button that toggles the visibility of a dropdown menu.
/// It's implemented using <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/popover">HTML popover</a> functionality.
///
class Dropdown extends StatefulComponent {
  final List<Component> label;
  final String labelClasses;
  final List<Component> dropdown;
  final String dropdownClasses;

  const Dropdown({
    super.key,
    required this.label,
    required this.dropdown,
    this.labelClasses = '',
    this.dropdownClasses = '',
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final String id = 'fui-dropdown-${_sequence++}';

  @override
  Component build(BuildContext context) {
    return Component.fragment(
      [
        button(
          id: "${id}_btn",
          classes: component.labelClasses,
          attributes: {
            "popovertarget": id,
            "style": "anchor-name: --$id-anchor;",
          },
          component.label,
        ),
        div(
          id: id,
          classes: component.dropdownClasses,
          attributes: {
            "popover": "",
            "style": "position: fixed; position-anchor: --$id-anchor; top: anchor(bottom); left: anchor(left);",
          },
          component.dropdown,
        ),
      ],
    );
  }
}
