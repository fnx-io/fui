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
      main: FuiHorizontalLayout(
        left: div([], classes: "p-10 bg-black h-full"),
        main: buildContent(context),
        right: div([], classes: "p-10 bg-black h-full"),
      ),
      footer: div([text('Footer goes here')], classes: 'p-4 text-center text-white bg-gray-500'),
    );
  }

  Component? buildContent(BuildContext context) {
    return text("Hello World");
  }
}
