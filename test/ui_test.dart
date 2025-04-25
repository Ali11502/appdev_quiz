import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_quiz/question2_3/main.dart';
import 'package:firebase_quiz/question2_3/screens/product_page.dart';

void main() {
  testWidgets('Golden test for AirPods Max UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for all images to load
    await tester.pumpAndSettle();

    // Verify the UI matches the golden file
    await expectLater(find.byType(ProductPage), matchesGoldenFile('ui_sc.png'));
  });
}
