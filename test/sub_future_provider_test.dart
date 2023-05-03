import 'package:flutter_sub_provider/flutter_sub_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
  group('SubFutureProvider', () {
    testWidgets('creates values correctly', (tester) async {
      final mock = MockConsumer<MockValue>();
      MockValue initial = MockValue();
      MockValue result = MockValue();

      await tester.pumpWidget(
        SubFutureProvider<MockValue>(
          initialData: initial,
          create: (context) async => result,
          builder: mock,
        ),
      );

      expect(
        mock.last,
        equals(initial),
      );
      await tester.pumpWidget(
        SubFutureProvider<MockValue>(
          initialData: initial,
          create: (context) async => result,
          builder: mock,
        ),
      );
      expect(
        mock.last,
        equals(result),
      );
    });
  });
}
