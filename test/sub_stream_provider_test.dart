import 'package:flutter_sub_provider/flutter_sub_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
  group('SubStreamProvider', () {
    testWidgets('creates values correctly', (tester) async {
      final mock = MockConsumer<MockValue>();
      MockValue initial = MockValue();
      MockValue result = MockValue();
      Stream<MockValue> stream = Stream.value(result);

      await tester.pumpWidget(
        SubStreamProvider<MockValue>(
          initialData: initial,
          create: (context) => stream,
          builder: mock,
        ),
      );

      expect(
        mock.last,
        equals(initial),
      );
      await tester.pumpWidget(
        SubStreamProvider<MockValue>(
          initialData: initial,
          create: (context) => stream,
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
