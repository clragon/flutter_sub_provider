import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:flutter_sub_provider/src/sub_provider.dart';
import 'package:provider/provider.dart';

/// Listens to a [Stream] and exposes its content to `child` and descendants.
///
/// Its main use-case is to provide to a large number of a widget the content
/// of a [Stream], without caring about reacting to events.
/// A typical example would be to expose the battery level, or a Firebase query.
///
/// Trying to use [Stream] to replace [ChangeNotifier] is outside of the scope
/// of this class.
///
/// The [keys] property can be used to recreate the [Stream] when desired.
///
/// It is considered an error to pass a stream that can emit errors without
/// providing a `catchError` method.
///
/// `initialData` determines the value exposed until the [Stream] emits a value.
///
/// By default, [SubStreamProvider] considers that the [Stream] listened uses
/// immutable data. As such, it will not rebuild dependents if the previous and
/// the new value are `==`.
/// To change this behavior, pass a custom `updateShouldNotify`.
///
/// This is a wrapper around [StreamProvider] with added [SubValue.keys].
///
/// See also:
/// - [Stream], which is listened by [SubStreamProvider].
/// - [StreamController], to create a [Stream].
class SubStreamProvider<T> extends SubProvider0<Stream<T>> {
  /// Listens to a [Stream] and exposes its content to `child` and descendants.
  const SubStreamProvider({
    required super.create,
    required this.initialData,
    super.keys,
    this.catchError,
    this.updateShouldNotify,
    super.builder,
    super.child,
  });

  /// The data provided before a value of the [Stream] has loaded.
  final T initialData;

  /// Called to handle errors that might occur in the [Stream].
  final ErrorBuilder<T>? catchError;

  /// {@macro provider.updateshouldnotify}
  final UpdateShouldNotify<T>? updateShouldNotify;

  @override
  Widget buildWithValue(BuildContext context, Stream<T> value, Widget? child) {
    return StreamProvider<T>.value(
      value: value,
      initialData: initialData,
      updateShouldNotify: updateShouldNotify,
      builder: builder,
      catchError: catchError,
      child: child,
    );
  }
}
