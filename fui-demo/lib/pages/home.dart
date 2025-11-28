import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_icons/jaspr_icons.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    var title = 'Welcome to Jaspr!';
    var message = 'Get started by editing lib/pages/home.dart';
    return FuiVerticalLayout(
      header: span([
        span([], classes: 'h-px flex-1'),
        span([text('Title goes here')], classes: 'shrink-0 px-4'),
        span([], classes: 'h-px flex-1'),
      ], classes: 'flex items-center p-4 text-center text-sm font-medium  bg-accent'),
      main: [
        FuiHorizontalLayout(
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
          (index) => FuiCard([text("Hojda! $index")], classes: "w-50 my-10 p-5 inline-block", elevation: index),
        ),
      ),
      div(
        classes: "space-x-2",
        [
          FuiButton(
            Action(text: "Button", onClick: (_) {}),
          ),
          FuiButton(
            Action(
              text: "Button",
              onClick: (_) {},
              icon: Icon(MaterialIcons.icon_deblur),
            ),
          ),
          FuiButton(
            Action(
              text: "Button",
              onClick: (_) {},
              icon: Icon(MaterialIcons.icon_add_location_alt),
            ),
            variant: Variant.accent,
          ),
          FuiButton(
            Action(
              text: "Disabled",
              icon: Icon(MaterialIcons.icon_add_road),
            ),
            variant: Variant.accent,
          ),
          FuiButton(
            Action(
              text: "Button",
              icon: Icon(MaterialIcons.icon_add_location_alt),
              children: [
                Action(text: "Sub Action 1", onClick: (_) {}),
                Action(text: "Sub Action 2", onClick: (_) {}),
              ],
            ),
          ),
        ],
      ),
      div(
        [
          FuiMenu(
            classes: "w-100",
            items: [
              Action(
                text: "Disabled",
                icon: Icon(MaterialIcons.icon_add_road),
              ),
              Action(
                text: "Button",
                icon: Icon(MaterialIcons.icon_add_location_alt),
                children: [
                  Action(text: "Sub Action 1", onClick: (_) {}),
                  Action(text: "Sub Action 2", onClick: (_) {}),
                  Action(
                    text: "Button 2",
                    icon: Icon(MaterialIcons.icon_add_location_alt),
                    children: [
                      Action(text: "Sub Action 21", onClick: (_) {}),
                      Action(text: "Sub Action 22", onClick: (_) {}),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
