import 'package:fui/fui.dart';
import 'package:fui/src/core/icons.dart';
import 'package:jaspr/jaspr.dart';

class VerticalMenu extends StatelessComponent {
  final List<Action> items;
  final String classes;

  const VerticalMenu({super.key, required this.items, this.classes = ''});

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
        classes: '',
        [
          details(
            classes: "fui-menu_detail",
            [
              summary(
                [
                  item.render(
                    "",
                    DisplayBase.block,
                    extraContent: [
                      span([Icons.moreChevron()], classes: "fui-icon ml-1 "),
                    ],
                  ),
                ],
                classes: 'cursor-pointer rounded-l hover:bg-light ',
              ),
              VerticalMenu(items: item.children, classes: 'ml-7'),
            ],
          ),
        ],
      );
    } else {
      return li(
        [item.render("", DisplayBase.block)],
        classes: "rounded-l hover:bg-light ",
      );
    }
  }
}
