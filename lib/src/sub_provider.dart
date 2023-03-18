import 'package:flutter/widgets.dart';
import 'package:flutter_sub/developer.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:flutter_sub_provider/src/types.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// {@macro subprovider.subprovider}
class SubProvider0<R> extends SingleChildStatelessWidget {
  /// {@macro subprovider.subprovider}
  const SubProvider0({
    super.key,
    super.child,
    this.builder,
    required this.create,
    this.update,
    this.keys,
    this.dispose,
  });

  final Widget Function(BuildContext context, Widget? child)? builder;

  /// Creates the value. Called at least once and everytime [keys] changes.
  final SubValueBuilderCreate<R> create;

  /// Updates the value. Called every build. If null, does nothing.
  /// In the call order, this comes after recreating the value.
  final SubValueBuilderUpdate<R>? update;

  /// Used to decide when to recreate the value. If null, the value is never recreated.
  final SubValueBuilderKeys? keys;

  /// Disposes the value. Called before recreation and when disposing. Useful for Listeners, etc.
  final SubValueBuilderDispose<R>? dispose;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      SubValue<R>.builder(
        create: create,
        keys: keys,
        update: update,
        dispose: dispose,
        builder: (context, value) => Provider.value(
          value: value,
          builder: builder,
          child: child,
        ),
      );
}

/// {@template subprovider.subprovider}
/// Manages a Value T and exposes it to its descendants.
/// Allows for smart Provider-Provider dependencies.
///
/// This is a combination of a [SubValue] and a [Provider].
/// Unlike a [ProxyProvider] where dependencies are sideloaded, this Widget completely recreates the Value when dependencies change.
///
/// The create function recieves all Providers which this depends on.
/// The Providers are additionally treated as keys, so create is called again,
/// should the Providers this [SubProvider] depends on change.
///
/// An example of a [ProxyProvider]
///
/// ```dart
/// ProxyProvider<MyModel, MyOtherModel>(
///   create: (_) => MyOtherModel(),
///   update: (_, myModel, myOtherModel) => myOtherModel
///     ..myModel = myModel,
///   child: /* ... */,
/// );
/// ```
///
/// looks like this as a [SubProvider]:
///
/// ```dart
/// SubProvider<MyModel, MyOtherModel>(
///   create: (_, myModel) => MyOtherModel(myModel: myModel),
///   child: /* ... */,
/// );
/// ```
///
/// The notable difference being, that myModel can now once again be passed through the constructor,
/// and does not have to be sideloaded. MyOtherModel is automatically recreated whenever myModel changes.
///
/// Just like [Provider]s, [SubProvider]s can be used inside of a [MultiProvider].
/// {@endtemplate}
class SubProvider<T, R> extends SubProvider0<R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate<T, R> create,
    SubProviderUpdate<T, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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

/// {@macro subprovider.subprovider}
class SubProvider2<T, T2, R> extends SubProvider<T, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider2({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate2<T, T2, R> create,
    SubProviderUpdate2<T, T2, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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

/// {@macro subprovider.subprovider}
class SubProvider3<T, T2, T3, R> extends SubProvider2<T, T2, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider3({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate3<T, T2, T3, R> create,
    SubProviderUpdate3<T, T2, T3, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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

/// {@macro subprovider.subprovider}
class SubProvider4<T, T2, T3, T4, R> extends SubProvider3<T, T2, T3, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider4({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate4<T, T2, T3, T4, R> create,
    SubProviderUpdate4<T, T2, T3, T4, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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

/// {@macro subprovider.subprovider}
class SubProvider5<T, T2, T3, T4, T5, R>
    extends SubProvider4<T, T2, T3, T4, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider5({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate5<T, T2, T3, T4, T5, R> create,
    SubProviderUpdate5<T, T2, T3, T4, T5, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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

/// {@macro subprovider.subprovider}
class SubProvider6<T, T2, T3, T4, T5, T6, R>
    extends SubProvider5<T, T2, T3, T4, T5, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider6({
    super.key,
    super.child,
    super.builder,
    required SubProviderCreate6<T, T2, T3, T4, T5, T6, R> create,
    SubProviderUpdate6<T, T2, T3, T4, T5, T6, R>? update,
    SubValueBuilderKeys? keys,
    super.dispose,
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
