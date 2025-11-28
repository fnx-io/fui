import 'package:fui/fui.dart';
import 'package:fui/src/core/fui_icons.dart';
import 'package:jaspr/jaspr.dart';

class FuiMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  const FuiMenu({super.key, required this.items, this.classes = ''});

  @override
  Component build(BuildContext context) {
    // Basic skeleton only; implementation will be added later
    return ul(
      classes: "space-y-1 $classes",
      items.map((item) => _buildItem(item)).toList(),
    );
  }

  Component _buildItem(Action item) {
    bool hasChildren = item.children.isNotEmpty;
    if (hasChildren) {
      return li(
        classes: '[&_summary::-webkit-details-marker]:hidden',
        [
          details(
            classes: "fui-menu_detail",
            [
              summary(
                [
                  ...Label.buildLabel(item.label),
                  span([
                    FuiIcons.moreChevron(),
                  ], classes: 'fui-icon shrink-0 transition duration-300'),
                ],
                classes: 'cursor-pointer rounded-lg hover:bg-light ' + Label.parentClass(DisplayBase.block),
              ),
              FuiMenu(items: item.children, classes: 'ml-7'),
            ],
          ),
        ],
      );
    } else {
      return li(
        Action.buildAction(item),
        classes: "rounded-lg px-4 py-2 hover:bg-app" + Label.parentClass(DisplayBase.block),
      );
    }
  }
}
