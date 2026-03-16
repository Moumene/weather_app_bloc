import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_bloc/main.dart';

void main() {
  testWidgets('Weather app loads and shows MaterialApp', (WidgetTester tester) async {
    await tester.pumpWidget(const WeatherApp());
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
