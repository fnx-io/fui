part of '../fui.dart';

/// Vertical layout with optional `header`, `main`, and `footer` sections.
///
/// - Uses flexbox (`flex flex-col`); the main section (`main`) expands to fill
///   the available height.
/// - Sections are wrapped in semantic HTML5 elements: `<header>`, `<main>`,
///   `<footer>`.
/// - The component expects its parent to be positioned (absolute/relative) and fills all available space using `absolute inset-0`.
/// - `main` has `overflow-auto` so its content scrolls automatically. `header` and
///   `footer` have `overflow-hidden`.
/// - Each section is positioned `relative` to allow absolute positioning of children (e.g., nested [FuiHorizontalLayout]).
///
/// Example usage:
///
/// ```dart
/// FuiVerticalLayout(
///   header: MyTopBar(),
///   main: const MyLongTable(),
///   footer: const MyCopyrightNotice(),
/// )
/// ```
class FuiVerticalLayout extends StatelessComponent {
  /// Optional component placed in the `<header>` element; typically a top bar or navigation.
  final Component? header;

  /// Main content placed inside the `<main>` element. This section expands and is scrollable. To avoid scrolling, give it 'absolute inset-0' styling.
  final Component? main;

  /// Optional component placed in the `<footer>` element; e.g., a status bar.
  final Component? footer;

  /// Creates a new vertical layout.
  ///
  /// The [header], [main], and [footer] parameters define the individual sections.
  /// Each is optional and, when `null`, the respective section is not rendered.
  const FuiVerticalLayout({super.key, this.header, this.main, this.footer});

  /// Sestaví strom komponent s kořenovým `<section>` obsahujícím `<header>`,
  /// `<main>` a `<footer>` podle dostupnosti vstupních komponent.
  @override
  Component build(BuildContext context) {
    return section(classes: 'absolute inset-0 flex flex-col', [
      if (header != null) jaspr.header([header!], classes: 'w-full flex-grow-0 flex-shrink-0 overflow-hidden relative'),
      if (main != null) main_([main!], classes: 'w-full flex-grow flex-shrink overflow-auto relative'),
      if (footer != null) jaspr.footer([footer!], classes: 'w-full flex-grow-0 flex-shrink-0 overflow-hidden relative'),
    ]);
  }
}
