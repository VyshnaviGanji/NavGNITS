import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:project3/main.dart';

void main() {
  testWidgets('App loads and displays initial UI', (WidgetTester tester) async {
    // Build the app using the correct widget.
    await tester.pumpWidget(const MaterialApp(home: MyApp()));

    // This test assumes something like a search bar or title is present
    // Adjust this based on actual visible text in your NavGNITs widget
    expect(find.byType(MyApp), findsOneWidget);
  });
}
