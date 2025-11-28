import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';

class FuiButton extends StatelessComponent {
  final Action action;
  final String classes;
  final Variant variant;

  const FuiButton(this.action, {super.key, this.classes = '', this.variant = Variant.light});

  @override
  Component build(BuildContext context) {
    final color = variant != Variant.neutral ? 'bg-${variant.name}' : '';
    final clickable = action.onClick != null;
    return button(
      [
        ...Action.buildAction(action),
        if (action.children.isNotEmpty) ...subActions(),
      ],
      disabled: action.isDisabled,
      events: {
        if (action.onClick != null) "onClick": action.onClick!,
      },
      classes:
          "${"fui-hill fui-elevate-1 rounded cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed " + Label.parentClass(DisplayBase.inline)}${clickable ? " hover:fui-elevate-2 active:fui-elevate-0 " : ""} $color $classes",
    );
  }

  List<Component> subActions() {
    return [
      div(
        action.children
            .map(
              (act) => a(
                [text(act.label.text ?? "-")],
                classes:
                    'block px-3 py-2 font-medium text-gray-700 transition-colors hover:bg-gray-50 hover:text-gray-900',
                href: '#',
                attributes: {'role': 'menuitem'},
              ),
            )
            .toList(),
        classes: 'absolute end-0 top-12 z-auto w-56 overflow-hidden rounded border border-gray-300 bg-white shadow-sm',
        attributes: {'role': 'menu'},
      ),
    ];
  }
}
