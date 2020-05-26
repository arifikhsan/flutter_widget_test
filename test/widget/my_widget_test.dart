import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_test/widget/my_widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'Title', message: 'Message'));

    final titleFinder = find.text('Title');
    final messageFinder = find.text('Message');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsWidgets);
    expect(messageFinder, findsNWidgets(1));
  });

  group('find widgets', () {
    testWidgets('finds a Text widget', (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: 'Title', message: 'Message'));

      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('finds a widget using a Key', (WidgetTester tester) async {
      final testKey = Key('Key');

      await tester.pumpWidget(MyWidget(
        key: testKey,
        title: 'Title',
        message: 'Message',
      ));

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('finds a specific instance', (WidgetTester tester) async {
      final childWidget = Padding(padding: EdgeInsets.zero);

      // Provide the childWidget to the Container.
      await tester.pumpWidget(Container(child: childWidget));

      // Search for the childWidget in the tree and verify it exists.
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
}
