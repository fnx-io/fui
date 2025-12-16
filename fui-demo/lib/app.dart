import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/about.dart';
import 'pages/home.dart';

// The main component of your application.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.

    // Renders a <div class="main"> html element with children.
    return div(classes: 'main', [
      Router(
        routes: [
          Route(path: '/', title: 'Home', builder: (context, state) => Home()),
          Route(path: '/about', title: 'About', builder: (context, state) => const About()),
        ],
      ),
    ]);
  }
}
