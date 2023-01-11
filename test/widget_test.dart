// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/main.dart';

void main() {
  testWidgets('Login form has valid fields', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify that the Email field exists
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email'),findsOneWidget);

    // Verify that the Password field exists
    expect(find.text('Password'),findsOneWidget);

    // Verify that the Login button exists
    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('Test login with valid credentials', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Fill the fields with valid inputs
    await tester.enterText(find.byType(TextFormField).first, 'email');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.pump();

    // press the login button
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    //Check if successful login message displayed
    expect(find.byKey(const ValueKey('id_success_text')), findsOneWidget);
  });

  testWidgets('Test login with invalid credentials', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Fill the fields with invalid inputs
    await tester.enterText(find.byType(TextFormField).first, 'invalidemail');
    await tester.enterText(find.byType(TextFormField).at(1), 'invalidpassword');
    await tester.pump();

    // press the login button
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    //Check if error message displayed
    expect(find.byKey(const ValueKey('id_failure_text')), findsOneWidget);
  });
}

