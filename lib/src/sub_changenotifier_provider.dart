import 'package:flutter/widgets.dart';
import 'package:flutter_sub/developer.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:flutter_sub_provider/src/sub_listenable_provider.dart';
import 'package:flutter_sub_provider/src/types.dart';
import 'package:provider/provider.dart';

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider0<R extends ChangeNotifier>
    extends SubListenableProvider0<R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider0({
    super.key,
    super.child,
    super.builder,
    required super.create,
    super.update,
    super.keys,
  }) : super(
          dispose: (context, value) => value.dispose(),
        );

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      SubValue<R>.builder(
        create: create,
        keys: keys,
        update: update,
        dispose: dispose,
        builder: (context, value) => ChangeNotifierProvider.value(
          value: value,
          builder: builder,
          child: child,
        ),
      );
}

/// {@template subprovider.subchangenotifierprovider}
/// Manages a ChangeNotifier and exposes it to its descendants.
/// Allows for smart Provider-Provider dependencies.
///
/// This is a combination of a [SubValue] and a [ChangeNotifierProvider].
/// Unlike a [ChangeNotifierProxyProvider] where dependencies are sideloaded, this Widget completely recreates the [ChangeNotifier] when dependencies change.
///
/// An example of a [ChangeNotifierProxyProvider]
///
/// ```dart
/// ChangeNotifierProxyProvider<MyModel, MyChangeNotifier>(
///   create: (_) => MyChangeNotifier(),
///   update: (_, myModel, myNotifier) => myNotifier
///     ..update(myModel),
///   child: /* ... */,
/// );
/// ```
///
/// looks like this as a [SubChangeNotifierProvider]:
///
/// ```dart
/// SubChangeNotifierProvider<MyModel, MyChangeNotifier>(
///   create: (_, myModel) => MyChangeNotifier(myModel: myModel),
///   child: /* ... */,
/// );
/// ```
///
/// The notable difference being, that myModel can now once again be passed through the constructor,
/// and does not have to be sideloaded. MyChangeNotifier is automatically recreated whenever myModel changes.
///
/// All Providers this Widget depends on are keys of the underlying [SubValue].
///
/// Just like [Provider]s, [SubChangeNotifierProvider]s can be used inside of a [MultiProvider].
/// {@endtemplate}
class SubChangeNotifierProvider<T, R extends ChangeNotifier>
    extends SubChangeNotifierProvider0<R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate<T, R> create,
    SubProviderUpdate<T, R>? update,
    SubValueBuilderKeys? keys,
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

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider2<T, T2, R extends ChangeNotifier>
    extends SubChangeNotifierProvider<T, R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider2({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate2<T, T2, R> create,
    SubProviderUpdate2<T, T2, R>? update,
    SubValueBuilderKeys? keys,
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

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider3<T, T2, T3, R extends ChangeNotifier>
    extends SubChangeNotifierProvider2<T, T2, R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider3({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate3<T, T2, T3, R> create,
    SubProviderUpdate3<T, T2, T3, R>? update,
    SubValueBuilderKeys? keys,
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

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider4<T, T2, T3, T4, R extends ChangeNotifier>
    extends SubChangeNotifierProvider3<T, T2, T3, R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider4({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate4<T, T2, T3, T4, R> create,
    SubProviderUpdate4<T, T2, T3, T4, R>? update,
    SubValueBuilderKeys? keys,
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

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider5<T, T2, T3, T4, T5, R extends ChangeNotifier>
    extends SubChangeNotifierProvider4<T, T2, T3, T4, R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider5({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate5<T, T2, T3, T4, T5, R> create,
    SubProviderUpdate5<T, T2, T3, T4, T5, R>? update,
    SubValueBuilderKeys? keys,
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

/// {@macro subprovider.subchangenotifierprovider}
class SubChangeNotifierProvider6<T, T2, T3, T4, T5, T6,
        R extends ChangeNotifier>
    extends SubChangeNotifierProvider5<T, T2, T3, T4, T5, R> {
  /// Manages a ChangeNotifier and exposes it to its descendants.
  SubChangeNotifierProvider6({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate6<T, T2, T3, T4, T5, T6, R> create,
    SubProviderUpdate6<T, T2, T3, T4, T5, T6, R>? update,
    SubValueBuilderKeys? keys,
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
