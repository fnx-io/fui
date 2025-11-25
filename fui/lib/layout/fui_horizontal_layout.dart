part of '../fui.dart';

/// Horizontal layout with optional `left`, `main`, and `right` sections.
///
/// - Uses flexbox (`flex flex-row`); the main section (`main`) expands to fill
///   the available width.
/// - Side sections (`left`, `right`) are rendered as semantic HTML5 `<aside>`
///   elements; the main section is `<main>`.
/// - The component expects its parent to be positioned (absolute/relative) and fills all available space using `absolute inset-0`.
/// - `main` has `overflow-auto` so its content scrolls automatically. `left` and
///   `right` have `overflow-hidden`.
/// - Each section is positioned `relative` to allow absolute positioning of children (e.g., nested [FuiVerticalLayout]).
///
/// Example usage:
///
/// ```dart
/// FuiHorizontalLayout(
///   left: MySidebar(),
///   main: const MyContent(),
///   right: const MyInspector(),
/// )
/// ```
class FuiHorizontalLayout extends StatelessComponent {
  /// Optional component placed in the left `<aside>`; typically a sidebar or navigation.
  final Component? left;

  /// Main content placed inside the `<main>` element. This section expands and is scrollable. To avoid scrolling, give it 'absolute inset-0' styling.
  final Component? main;

  /// Optional component placed in the right `<aside>`; e.g., details or an inspector.
  final Component? right;

  /// Creates a new horizontal layout.
  ///
  /// The [left], [main], and [right] parameters define the individual sections.
  /// Each is optional and, when `null`, the respective section is not rendered.
  const FuiHorizontalLayout({super.key, this.left, this.main, this.right});

  /// Builds a component tree with a root `<section>` containing `<aside>`,
  /// `<main>`, and `<aside>` (for the right panel) based on which components are provided.
  @override
  Component build(BuildContext context) {
    return section(classes: 'absolute inset-0 flex flex-row', [
      if (left != null) jaspr.aside([left!], classes: 'h-full flex-grow-0 flex-shrink-0 overflow-hidden relative'),
      if (main != null) main_([main!], classes: 'h-full flex-grow flex-shrink overflow-auto relative'),
      if (right != null) jaspr.aside([right!], classes: 'h-full flex-grow-0 flex-shrink-0 overflow-hidden relative'),
    ]);
  }
}
