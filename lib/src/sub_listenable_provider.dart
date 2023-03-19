import 'package:flutter/widgets.dart';
import 'package:flutter_sub/developer.dart';
import 'package:flutter_sub_provider/src/sub_changenotifier_provider.dart';
import 'package:flutter_sub_provider/src/sub_provider.dart';
import 'package:flutter_sub_provider/src/types.dart';
import 'package:provider/provider.dart';

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider0<R extends Listenable> extends SubProvider0<R> {
  /// {@macro subprovider.subListenableprovider}
  const SubListenableProvider0({
    required super.create,
    super.update,
    super.keys,
    super.dispose,
    super.builder,
    super.child,
  });

  @override
  Widget buildWithValue(BuildContext context, R value, Widget? child) {
    return ListenableProvider<R>.value(
      value: value,
      builder: builder,
      child: child,
    );
  }
}

/// {@template subprovider.subListenableprovider}
/// Manages a Listenable and exposes it to its descendants.
/// Allows for smart Provider-Provider dependencies.
///
/// See [SubChangeNotifierProvider] for a complete explanation on how to use it.
/// {@endtemplate}
class SubListenableProvider<T, R extends Listenable>
    extends SubListenableProvider0<R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider({
    required SubProviderCreate<T, R> create,
    SubProviderUpdate<T, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context) => create(
            context,
            Provider.of<T>(context),
          ),
          update: update != null
              ? (context, previous) => update(
                    context,
                    Provider.of<T>(context),
                    previous,
                  )
              : null,
          keys: (context) => [Provider.of<T>(context), keys?.call(context)],
        );
}

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider2<T, T2, R extends Listenable>
    extends SubListenableProvider<T, R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider2({
    required SubProviderCreate2<T, T2, R> create,
    SubProviderUpdate2<T, T2, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context, value) => create(
            context,
            value,
            Provider.of<T2>(context),
          ),
          update: update != null
              ? (context, value, previous) =>
                  update(context, value, Provider.of<T2>(context), previous)
              : null,
          keys: (context) => [Provider.of<T2>(context), keys?.call(context)],
        );
}

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider3<T, T2, T3, R extends Listenable>
    extends SubListenableProvider2<T, T2, R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider3({
    required SubProviderCreate3<T, T2, T3, R> create,
    SubProviderUpdate3<T, T2, T3, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context, value, value2) => create(
            context,
            value,
            value2,
            Provider.of<T3>(context),
          ),
          update: update != null
              ? (context, value, value2, previous) => update(
                  context, value, value2, Provider.of<T3>(context), previous)
              : null,
          keys: (context) => [Provider.of<T3>(context), keys?.call(context)],
        );
}

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider4<T, T2, T3, T4, R extends Listenable>
    extends SubListenableProvider3<T, T2, T3, R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider4({
    required SubProviderCreate4<T, T2, T3, T4, R> create,
    SubProviderUpdate4<T, T2, T3, T4, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context, value, value2, value3) => create(
            context,
            value,
            value2,
            value3,
            Provider.of<T4>(context),
          ),
          update: update != null
              ? (context, value, value2, value3, previous) => update(context,
                  value, value2, value3, Provider.of<T4>(context), previous)
              : null,
          keys: (context) => [Provider.of<T4>(context), keys?.call(context)],
        );
}

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider5<T, T2, T3, T4, T5, R extends Listenable>
    extends SubListenableProvider4<T, T2, T3, T4, R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider5({
    required SubProviderCreate5<T, T2, T3, T4, T5, R> create,
    SubProviderUpdate5<T, T2, T3, T4, T5, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context, value, value2, value3, value4) => create(
            context,
            value,
            value2,
            value3,
            value4,
            Provider.of<T5>(context),
          ),
          update: update != null
              ? (context, value, value2, value3, value4, previous) => update(
                  context,
                  value,
                  value2,
                  value3,
                  value4,
                  Provider.of<T5>(context),
                  previous)
              : null,
          keys: (context) => [Provider.of<T5>(context), keys?.call(context)],
        );
}

/// {@macro subprovider.subListenableprovider}
class SubListenableProvider6<T, T2, T3, T4, T5, T6, R extends Listenable>
    extends SubListenableProvider5<T, T2, T3, T4, T5, R> {
  /// Manages a Listenable and exposes it to its descendants.
  SubListenableProvider6({
    required SubProviderCreate6<T, T2, T3, T4, T5, T6, R> create,
    SubProviderUpdate6<T, T2, T3, T4, T5, T6, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
    super.builder,
    super.child,
  }) : super(
          create: (context, value, value2, value3, value4, value5) => create(
            context,
            value,
            value2,
            value3,
            value4,
            value5,
            Provider.of<T6>(context),
          ),
          update: update != null
              ? (context, value, value2, value3, value4, value5, previous) =>
                  update(context, value, value2, value3, value4, value5,
                      Provider.of<T6>(context), previous)
              : null,
          keys: (context) => [Provider.of<T6>(context), keys?.call(context)],
        );
}
