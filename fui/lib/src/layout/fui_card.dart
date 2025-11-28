import 'package:jaspr/jaspr.dart';

/// A simple card container component.
///
/// `FuiCard` renders a `div` with a rounded border and an elevation class
/// that controls its visual depth (shadow). You can also pass additional
/// CSS classes via [classes] and its child components via [children].
///
/// Elevation accepts values from 0 to 3 (inclusive):
/// - 0: microscopic elevation
/// - 1: low elevation (default)
/// - 2: medium elevation
/// - 3: high elevation
///
/// Example:
/// ```dart
/// FuiCard([
///   text('Card content'),
/// ], elevation: 2, classes: 'p-2');
/// ```
class FuiCard extends StatelessComponent {
  /// Visual depth level for the card (0–3). See class docs for details.
  final int elevation;

  /// Additional CSS classes added to the root `div`.
  final String classes;

  /// Children rendered inside the card.
  final List<Component> children;

  /// Creates a new [FuiCard].
  ///
  /// The [elevation] must be between 0 and 3 (inclusive). In debug mode,
  /// an assertion error is thrown when the given elevation is out of range.
  const FuiCard(this.children, {super.key, this.elevation = 1, this.classes = ''});

  @override
  // Nullable BuildContext is here for unit test purposes.
  Component build(BuildContext? context) {
    assert(elevation >= 0 && elevation <= 3);
    return div(
      classes:
          'relative fui-elevate-$elevation rounded-lg'
          ' $classes',
      children,
    );
  }
}
