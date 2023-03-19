import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sub/developer.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:provider/single_child_widget.dart';

/// A [SubValue] that implements [SingleChildWidget] and is therefore
/// compatible with Nested.
///
/// Its [build] method must **not** be overriden. Instead use [buildWithValue].
abstract class SingleChildSubValue<T> extends SingleChildStatelessWidget {
  /// Creates a widget that has exactly one child widget.
  const SingleChildSubValue({
    required this.create,
    this.update,
    this.keys,
    this.dispose,
    super.child,
  });

  /// Creates the value. Called at least once and everytime [keys] changes.
  final SubValueBuilderCreate<T> create;

  /// Updates the value. Called every build. If null, does nothing.
  /// In the call order, this comes after recreating the value.
  final SubValueBuilderUpdate<T>? update;

  /// Used to decide when to recreate the value. If null, the value is never recreated.
  final SubValueBuilderKeys? keys;

  /// Disposes the value. Called before recreation and when disposing. Useful for Listeners, etc.
  final SubValueBuilderDispose<T>? dispose;

  @override
  @nonVirtual
  Widget buildWithChild(BuildContext context, Widget? child) {
    return SubValue<T>.builder(
      create: create,
      keys: keys,
      update: update,
      dispose: dispose,
      builder: (context, value) => buildWithValue(context, value, child),
    );
  }

  /// A [build] method that receives both a `value` and a `child` parameter.
  Widget buildWithValue(BuildContext context, T value, Widget? child);
}
