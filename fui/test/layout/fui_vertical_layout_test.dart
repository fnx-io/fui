// This also exports 'package:test' so no need for an additional import.
// Import the component to test.
import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/jaspr_test.dart';

void main() {
  group('FuiVerticalLayout conditional rendering', () {
    testComponents('renders all sections when provided', (tester) async {
      tester.pumpComponent(
        FuiVerticalLayout(
          header: text('H'),
          main: [text('M')],
          footer: text('F'),
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('header'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('footer'), findsOneComponent);
    });

    testComponents('renders only main when only main is provided', (tester) async {
      tester.pumpComponent(
        FuiVerticalLayout(
          main: [text('Main only')],
        ),
      );

      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('header'), findsNothing);
      expect(find.tag('footer'), findsNothing);
    });

    testComponents('renders header + main when footer is null', (tester) async {
      tester.pumpComponent(
        FuiVerticalLayout(
          header: text('H'),
          main: [text('M')],
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('header'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('footer'), findsNothing);
    });

    testComponents('renders main + footer when header is null', (tester) async {
      tester.pumpComponent(
        FuiVerticalLayout(
          main: [text('M')],
          footer: text('F'),
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('footer'), findsOneComponent);
      expect(find.tag('header'), findsNothing);
    });

    testComponents('renders only empty main when no header/footer and empty main list', (tester) async {
      tester.pumpComponent(
        const FuiVerticalLayout(main: []),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('header'), findsNothing);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('footer'), findsNothing);
    });
  });
}
