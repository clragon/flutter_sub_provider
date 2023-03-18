import 'package:flutter/widgets.dart';
import 'package:flutter_sub_provider/flutter_sub_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
  group('SubChangeNotifierProvider', () {
    testWidgets('creates values correctly', (tester) async {
      final mock = MockConsumer<ValueNotifier<MockValue>>();
      final parent1 = MockValue();
      final parent2 = MockValue2();
      final parent3 = MockValue3();
      final parent4 = MockValue4();
      final parent5 = MockValue5();
      final parent6 = MockValue6();
      late MockValue updates;

      await tester.pumpWidget(
        MultiProvider(providers: [
          Provider.value(
            value: parent1,
          ),
          Provider.value(
            value: parent2,
          ),
          Provider.value(
            value: parent3,
          ),
          Provider.value(
            value: parent4,
          ),
          Provider.value(
            value: parent5,
          ),
          Provider.value(
            value: parent6,
          ),
          SubChangeNotifierProvider6<MockValue, MockValue2, MockValue3,
              MockValue4, MockValue5, MockValue6, ValueNotifier<MockValue>>(
            create: (
              context,
              parent1,
              parent2,
              parent3,
              parent4,
              parent5,
              parent6,
            ) =>
                ValueNotifier(
              MockValue(
                [
                  parent1,
                  parent2,
                  parent3,
                  parent4,
                  parent5,
                  parent6,
                ],
              ),
            ),
            update: (
              context,
              parent1,
              parent2,
              parent3,
              parent4,
              parent5,
              parent6,
              previous,
            ) {
              updates = MockValue([
                parent1,
                parent2,
                parent3,
                parent4,
                parent5,
                parent6,
                previous,
              ]);
              return previous;
            },
            builder: mock,
          ),
        ]),
      );

      expect(
        mock.single.value.deps,
        equals([
          parent1,
          parent2,
          parent3,
          parent4,
          parent5,
          parent6,
        ]),
      );
      expect(
        updates.deps,
        equals([
          parent1,
          parent2,
          parent3,
          parent4,
          parent5,
          parent6,
          mock.single,
        ]),
      );
    });
  });
}
