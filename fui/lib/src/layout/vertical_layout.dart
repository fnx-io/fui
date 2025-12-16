import 'package:jaspr/jaspr.dart' as jaspr;
import 'package:jaspr/jaspr.dart';

/// Vertical layout with optional `header`, `main`, and `footer` sections.
///
/// - Uses flexbox (`flex flex-col`); the main section (`main`) expands to fill
///   the available height.
/// - Sections are wrapped in semantic HTML5 elements: `<header>`, `<main>`,
///   `<footer>`.
/// - The component expects its parent to be positioned (absolute/relative) and fills all available space using `absolute inset-0`.
/// - `main` has `overflow-auto` so its content scrolls automatically. `header` and
///   `footer` have `overflow-hidden`.
/// - Each section is positioned `relative` to allow absolute positioning of children (e.g., nested [HorizontalLayout]).
///
/// Example usage:
///
/// ```dart
/// VerticalLayout(
///   header: MyTopBar(),
///   main: const [MyLongTable()],
///   footer: const MyCopyrightNotice(),
/// )
/// ```
class VerticalLayout extends StatelessComponent {
  /// Optional component placed in the `<header>` element; typically a top bar or navigation.
  final Component? header;

  /// Main content placed inside the `<main>` element. This section expands and is scrollable. To avoid scrolling, use one children and give it 'absolute inset-0' classes.
  final List<Component> main;

  /// Optional component placed in the `<footer>` element; e.g., a status bar.
  final Component? footer;

  final String classes;

  /// Creates a new vertical layout.
  ///
  /// The [main] parameter defines the primary content and is required as a list
  /// of components. The [header] and [footer] parameters are optional; when `null`,
  /// their respective sections are not rendered.
  const VerticalLayout({super.key, this.header, required this.main, this.footer, this.classes = ''});

  /// Sestaví strom komponent s kořenovým `<section>` obsahujícím `<header>`,
  /// `<main>` a `<footer>` podle dostupnosti vstupních komponent.
  @override
  Component build(BuildContext context) {
    return section(classes: 'absolute inset-0 flex flex-col', [
      if (header != null) jaspr.header([header!], classes: 'w-full flex-grow-0 flex-shrink-0 relative'),
      main_(main, classes: 'w-full flex-grow flex-shrink relative'),
      if (footer != null) jaspr.footer([footer!], classes: 'w-full flex-grow-0 flex-shrink-0 relative'),
    ]);
  }
}
