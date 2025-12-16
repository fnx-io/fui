// This also exports 'package:test' so no need for an additional import.
// Import the component to test.
import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/jaspr_test.dart';

void main() {
  group('HorizontalLayout conditional rendering', () {
    testComponents('renders all sections when provided', (tester) async {
      tester.pumpComponent(
        HorizontalLayout(
          left: text('L'),
          main: [text('M')],
          right: text('R'),
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('aside'), findsNComponents(2));
    });

    testComponents('renders only main when only main is provided', (tester) async {
      tester.pumpComponent(
        HorizontalLayout(
          main: [text('Main only')],
        ),
      );

      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('aside'), findsNothing);
    });

    testComponents('renders left + main when right is null', (tester) async {
      tester.pumpComponent(
        HorizontalLayout(
          left: text('L'),
          main: [text('M')],
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('aside'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
    });

    testComponents('renders main + right when left is null', (tester) async {
      tester.pumpComponent(
        HorizontalLayout(
          main: [text('M')],
          right: text('R'),
        ),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('main'), findsOneComponent);
      expect(find.tag('aside'), findsOneComponent);
    });

    testComponents('renders only empty main when no side panels and empty main list', (tester) async {
      tester.pumpComponent(
        const HorizontalLayout(main: []),
      );
      expect(find.tag('section'), findsOneComponent);
      expect(find.tag('aside'), findsNothing);
      expect(find.tag('main'), findsOneComponent);
    });
  });
}
