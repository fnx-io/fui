// This also exports 'package:test' so no need for an additional import.
// Import the component to test.
import 'package:fui/fui.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_test/jaspr_test.dart';

void main() {
  group('FuiCard', () {
    testComponents('renders a single div as root', (tester) async {
      tester.pumpComponent(
        FuiCard([
          span([text('A')]),
        ]),
      );
      expect(find.tag('div'), findsOneComponent);
    });

    testComponents('renders provided children', (tester) async {
      tester.pumpComponent(
        FuiCard([
          span([text('A')]),
          span([text('B')]),
        ]),
      );
      expect(find.tag('div'), findsOneComponent);
      expect(find.tag('span'), findsNComponents(2));
    });

    testComponents('supports boundary elevations 0 and 3', (tester) async {
      tester.pumpComponent(
        FuiCard([
          span([text('A')]),
        ], elevation: 0),
      );
      expect(find.tag('div'), findsOneComponent);

      tester.pumpComponent(
        FuiCard([
          span([text('B')]),
        ], elevation: 3),
      );
      expect(find.tag('div'), findsOneComponent);
    });

    test('throws AssertionError for invalid elevation < 0', () {
      expect(
        () => FuiCard(const [], elevation: -1).build(null),
        throwsA(isA<AssertionError>()),
      );
    });

    test('throws AssertionError for invalid elevation > 3', () {
      expect(
        () => FuiCard(const [], elevation: 4).build(null),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
