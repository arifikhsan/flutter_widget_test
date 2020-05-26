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
}
