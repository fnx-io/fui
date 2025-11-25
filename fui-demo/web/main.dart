// The entrypoint for the **client** environment.
//
// This file is compiled to javascript and executed in the browser.

// Imports the [App] component.
import 'package:fui_demo/app.dart';
// Client-specific jaspr import.
import 'package:jaspr/browser.dart';

void main() {
  // Attaches the [App] component to the <body> of the page.
  runApp(App());
}
