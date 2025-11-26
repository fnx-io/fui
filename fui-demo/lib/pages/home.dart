import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    var title = 'Welcome to Jaspr!';
    var message = 'Get started by editing lib/pages/home.dart';
    return FuiVerticalLayout(
      header: span([
        span([], classes: 'h-px flex-1 bg-primary'),
        span([text('Title goes here')], classes: 'shrink-0 px-4 text-secondary'),
        span([], classes: 'h-px flex-1 bg-primary'),
      ], classes: 'flex items-center bg-red-500 p-4 text-center text-sm font-medium text-primary'),
      main: [
        FuiHorizontalLayout(
          left: div([], classes: "p-10 bg-gray-300 h-full"),
          main: [buildContent(context)],
          right: div([], classes: "p-10 bg-gray-300 h-full"),
        ),
      ],
      footer: div([text('Footer goes here')], classes: 'p-4 text-center text-white bg-gray-500'),
    );
  }

  Component buildContent(BuildContext context) {
    return div(
      List.generate(
        4,
        (index) => FuiCard([text("Hojda! $index")], classes: "w-50 my-10 p-5", elevation: index),
      ),
      classes: "fui-sink-1 p-50 bg-gray-200 h-full",
    );
  }
}
