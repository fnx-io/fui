part of '../fui.dart';

class FuiCard extends StatelessComponent {
  final int elevation;
  final String classes;
  final List<Component> children;

  const FuiCard(this.children, {super.key, this.elevation = 1, this.classes = ''});

  @override
  Component build(BuildContext context) {
    assert(elevation >= 0 && elevation <= 5);
    return div(
      classes:
          'relative fui-elevate-$elevation rounded-lg'
          ' $classes',
      children,
    );
  }
}
