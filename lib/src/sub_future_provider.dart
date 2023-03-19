import 'package:flutter/widgets.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:flutter_sub_provider/src/sub_provider.dart';
import 'package:provider/provider.dart';

/// Listens to a [Future] and exposes its result to `child` and its descendants.
///
/// The [keys] property can be used to recreate the [Future] when desired.
///
/// It is considered an error to pass a future that can emit errors without
/// providing a `catchError` method.
///
/// {@macro provider.updateshouldnotify}
///
/// This is a wrapper around [FutureProvider] with added [SubValue.keys].
///
/// See also:
/// - [Future], which is listened to by [SubFutureProvider].
class SubFutureProvider<T> extends SubProvider0<Future<T>> {
  /// Listens to a [Future] and exposes its result to `child` and its descendants.
  const SubFutureProvider({
    required super.create,
    required this.initialData,
    super.keys,
    this.catchError,
    this.updateShouldNotify,
    super.builder,
    super.child,
  });

  /// The data provided before the [Future] has loaded.
  final T initialData;

  /// Called to handle errors that might occur in the [Future].
  final ErrorBuilder<T>? catchError;

  /// {@macro provider.updateshouldnotify}
  final UpdateShouldNotify<T>? updateShouldNotify;

  @override
  Widget buildWithValue(BuildContext context, Future<T> value, Widget? child) {
    return FutureProvider<T>.value(
      value: value,
      initialData: initialData,
      updateShouldNotify: updateShouldNotify,
      builder: builder,
      catchError: catchError,
      child: child,
    );
  }
}
