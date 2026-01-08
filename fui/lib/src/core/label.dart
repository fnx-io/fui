import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart' as jaspr;
import 'package:jaspr/jaspr.dart';

class Label extends StatelessComponent {
  final String? text;
  final Component? icon;

  const Label({super.key, this.text, this.icon});

  @override
  Component build(BuildContext context) {
    return span(buildLabel(this));
  }

  static List<jaspr.Component> buildLabel(Label label) {
    return [
      if (label.icon != null) span([label.icon!], classes: "fui-icon"),
      if (label.text != null) span([jaspr.text(label.text!)], classes: "grow-1"),
    ];
  }

  static List<jaspr.Component> buildIcon(Label label) {
    return [
      span([label.icon ?? Icons.moreDots()], classes: "fui-icon"),
    ];
  }
}
