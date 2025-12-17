import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_icons/jaspr_icons.dart';

class Home extends StatelessComponent {
  Home({super.key});

  final menuActions = [
    GroupAction(
      text: "I'm a group",
      icon: Icon(MaterialIcons.icon_add_location_alt),
      children: [
        LinkAction(text: "Sub LinkAction 1", href: "https://example1.com"),
        LinkAction(text: "Sub LinkAction 2", href: "https://example2.com"),
        GroupAction(
          text: "I'm sub group",
          icon: Icon(MaterialIcons.icon_add_location_alt),
          children: [
            ButtonAction(text: "Sub ButtonAction 21", onClick: (_) {}),
            ButtonAction(text: "Sub ButtonAction 22", onClick: (_) {}),
            ButtonAction(text: "Disabled road", icon: Icon(MaterialIcons.icon_add_road)),
            LinkAction(text: "Sub LinkAction 21", href: "https://example1.com"),
            LinkAction(text: "Sub LinkAction 22", href: "https://example2.com"),
          ],
        ),
        ButtonAction(text: "Disabled", icon: Icon(MaterialIcons.icon_add_road)),
      ],
    ),
    ButtonAction(text: "Button 1", onClick: (_) {}),
    ButtonAction(text: "Button 2", onClick: (_) {}),
    LinkAction(text: "Link 1", href: "https://example1.com"),
    ButtonAction(text: "Disabled", icon: Icon(MaterialIcons.icon_add_road)),
  ];

  @override
  Component build(BuildContext context) {
    return VerticalLayout(
      header: span([
        span([], classes: 'h-px flex-1'),
        span([text('Title goes here')], classes: 'shrink-0 px-4'),
        span([], classes: 'h-px flex-1'),
      ], classes: 'flex items-center p-4 text-center text-sm font-medium bg-accent'),
      main: [
        HorizontalLayout(
          left: div([], classes: "p-10 bg-primary h-full"),
          main: [buildContent(context)],
          right: div([], classes: "p-10 bg-primary h-full"),
        ),
      ],
      footer: div([text('Footer goes here')], classes: 'p-4 text-center bg-accent'),
    );
  }

  Component buildContent(BuildContext context) {
    return div(classes: "m2", [
      div(
        classes: "space-x-2",
        List.generate(
          4,
          (index) => Card([text("Hojda! $index")], classes: " w-40 my-10 p-5 inline-block", elevation: index),
        ),
      ),
      div(
        classes: "space-x-2",
        menuActions.map((a) => Button(a)).toList(),
      ),
      div([
        HorizontalMenu(items: menuActions),
      ], classes: "my-5 "),
      div([
        VerticalMenu(classes: "w-70 bg-white", items: menuActions),
      ], classes: "my-5 "),
      // div(
      //   classes: "my-10",
      //   [
      //     Dropdown(
      //       label: [
      //         span([text("Open Dropdown")]),
      //       ],
      //       dropdown: [
      //         span([text("Opened Dropdown")]),
      //       ],
      //     ),
      //   ],
      // ),
    ]);
  }
}
