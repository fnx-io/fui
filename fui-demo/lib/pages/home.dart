import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_icons/jaspr_icons.dart';

class Home extends StatelessComponent {
  Home({super.key});

  final menuActions = [
    GroupAction(
      text: "Button",
      icon: Icon(MaterialIcons.icon_add_location_alt),
      children: [
        GroupAction(
          text: "Sub group",
          icon: Icon(MaterialIcons.icon_add_location_alt),
          children: [
            ButtonAction(text: "Sub ButtonAction 21", onClick: (_) {}),
            ButtonAction(
              text: "Disabled",
              icon: Icon(MaterialIcons.icon_add_road),
            ),
            ButtonAction(text: "Sub ButtonAction 22", onClick: (_) {}),
          ],
        ),
        ButtonAction(text: "Sub ButtonAction 1", onClick: (_) {}),
        ButtonAction(text: "Sub ButtonAction 2", onClick: (_) {}),
        ButtonAction(
          text: "Disabled",
          icon: Icon(MaterialIcons.icon_add_road),
        ),
      ],
    ),
    ButtonAction(text: "Main 1", onClick: (_) {}),
    ButtonAction(text: "Main 2", onClick: (_) {}),
    ButtonAction(
      text: "Disabled",
      icon: Icon(MaterialIcons.icon_add_road),
    ),
  ];

  @override
  Component build(BuildContext context) {
    return VerticalLayout(
      header: span([
        span([], classes: 'h-px flex-1'),
        span([text('Title goes here')], classes: 'shrink-0 px-4'),
        span([], classes: 'h-px flex-1'),
      ], classes: 'flex items-center p-4 text-center text-sm font-medium  bg-accent'),
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
    return div([
      div(
        classes: "space-x-2",
        List.generate(
          4,
          (index) => Card([text("Hojda! $index")], classes: "w-40 my-10 p-5 inline-block", elevation: index),
        ),
      ),
      div(
        classes: "space-x-2",
        [
          Button(
            ButtonAction(text: "Button", onClick: (_) {}),
          ),
          Button(
            ButtonAction(
              text: "Button",
              onClick: (_) {},
              icon: Icon(MaterialIcons.icon_deblur),
            ),
          ),
          Button(
            ButtonAction(
              text: "Button",
              onClick: (_) {},
              icon: Icon(MaterialIcons.icon_add_location_alt),
            ),
            variant: Variant.accent,
          ),
          Button(
            ButtonAction(
              text: "Disabled",
              icon: Icon(MaterialIcons.icon_add_road),
            ),
            variant: Variant.accent,
          ),
          Button(menuActions.first),
        ],
      ),
      div(
        classes: "my-10",
        [
          Dropdown(
            label: [
              span([text("Open Dropdown")]),
            ],
            dropdown: [
              span([text("Opened Dropdown")]),
            ],
          ),
        ],
      ),
      div([
        HorizontalMenu(items: menuActions),
      ], classes: "my-5 "),
      div([
        VerticalMenu(classes: "w-70", items: menuActions),
      ], classes: "my-5 "),
    ]);
  }
}
