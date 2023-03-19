import 'package:flutter/widgets.dart';
import 'package:flutter_sub/developer.dart';
import 'package:flutter_sub/flutter_sub.dart';
import 'package:flutter_sub_provider/src/single_child_sub_value.dart';
import 'package:flutter_sub_provider/src/types.dart';
import 'package:provider/provider.dart';

/// {@macro subprovider.subprovider}
class SubProvider0<R> extends SingleChildSubValue<R> {
  /// {@macro subprovider.subprovider}
  const SubProvider0({
    required super.create,
    super.update,
    super.keys,
    super.dispose,
    this.builder,
    super.child,
  });

  /// Builds the child of this Widget.
  final TransitionBuilder? builder;

  @override
  Widget buildWithValue(BuildContext context, R value, Widget? child) {
    return Provider<R>.value(
      value: value,
      builder: builder,
      child: child,
    );
  }
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

/// {@macro subprovider.subprovider}
class SubProvider2<T, T2, R> extends SubProvider<T, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider2({
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

/// {@macro subprovider.subprovider}
class SubProvider3<T, T2, T3, R> extends SubProvider2<T, T2, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider3({
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

/// {@macro subprovider.subprovider}
class SubProvider4<T, T2, T3, T4, R> extends SubProvider3<T, T2, T3, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider4({
    required SubProviderCreate4<T, T2, T3, T4, R> create,
    SubProviderUpdate4<T, T2, T3, T4, R>? update,
    SubValueBuilderKeys? keys,
    super.builder,
    super.child,
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

/// {@macro subprovider.subprovider}
class SubProvider6<T, T2, T3, T4, T5, T6, R>
    extends SubProvider5<T, T2, T3, T4, T5, R> {
  /// Manages a Value T and exposes it to its descendants.
  SubProvider6({
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
