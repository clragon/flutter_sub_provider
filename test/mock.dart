import 'package:flutter/widgets.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockConsumer<T> extends Mock {
  MockConsumer({this.child});

  final Widget? child;

  List<T> args = [];
  Set<T> get uargs => args.toSet();

  T get single {
    assert(uargs.length == 1, 'unique args was length > 1');
    return uargs.last;
  }

  T get first => args.first;
  T get last => args.last;

  Widget call(
    BuildContext context,
    Widget? child,
  ) {
    args.add(context.watch<T>());
    return child ?? const SizedBox();
  }
}

class MockValue extends Mock {
  MockValue([this.deps]);

  final List<Object>? deps;

  @override
  String toString() => identityHashCode(this).toString();
}

class MockValue2 extends MockValue {}

class MockValue3 extends MockValue {}

class MockValue4 extends MockValue {}

class MockValue5 extends MockValue {}

class MockValue6 extends MockValue {}
