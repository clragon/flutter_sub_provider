[![pub package](https://img.shields.io/pub/v/flutter_sub_provider.svg)](https://pub.dartlang.org/packages/flutter_sub_provider)
[![Build Status](https://github.com/clragon/flutter_sub_provider/actions/workflows/test.yml/badge.svg)](https://github.com/clragon/flutter_sub_provider/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/clragon/flutter_sub_provider/badge.svg)](https://coveralls.io/github/clragon/flutter_sub_provider)

# Flutter Sub Provider

Allows creating sane Provider to Provider dependencies with the help of [flutter_sub](https://pub.dartlang.org/packages/flutter_sub).

A SubProvider is much like a ProxyProvider except that it is fully recreated when its dependencies change.

## Motivation

When doing dependency injection with Provider, it is often necessary to create a Provider that depends on another Provider.

For example, a `PaginationController` may depend on an `HttpClient` to make requests.
In flutter_sub_provider, this may look like the following:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubProvider<HttpClient, PaginationController>(
      create: (context, httpClient) => PaginationController(client: httpClient),
      builder: (context, child) => /* ... */,
    );
  }
}
```

Whenever the `HttpClient` changes, a new `PaginationController` is created, and the widget is rebuilt with the new controller.  
Under the hood, `SubProvider` is using `SubValue` from `flutter_sub` to manage the `PaginationController`.

Contrast this with the equivalent `ProxyProvider` code:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider<HttpClient, PaginationController>(
      update: (context, httpClient, paginationController) => paginationController..httpClient = httpClient,
      builder: (context, child) => /* ... */,
    );
  }
}
```

In the `ProxyProvider` example, dependencies are side-loaded through a setter, and the `PaginationController` is updated in-place when the `HttpClient` changes.

The approach of SubProvider is preferable for several reasons:

- The dependencies are injected through the constructor instead of through a setter. This ensures our controller is always created in a valid state.
- The internal state of the controller is reset when the http client changes. This ensures that we don't have any stale data from the previous http client.
- The http client can be final and / or private. The controller retains control over its variables.

## Principles

`flutter_sub_provider` uses `flutter_sub`'s concept of a Sub, a shortcut to a StatefulWidget, and combines it with `provider` to create SubProviders.

SubProviders extend the corresponding Provider type and add the ability to handle changing dependencies.  
When a dependency updates, the SubProvider fully recreates its managed object, ensuring that it always operates on the latest dependencies.

For simplicity, you can imagine a SubProvider to look somewhat like this:

```dart
class SubProvider<T, R> extends StatelessWidget {
  SubProvider({
    required this.create,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final dependency = Provider.of<T>(context);
    return SubValue<R>.builder(
      create: create(context, dependency),
      keys: [dependency],
      builder: (context, value) =>
        Provider<R>.value(
          value: value,
          builder: builder,
        ),
    );
  }
}
```

This code is heavily simplified. To see the full implementation, you can check out the [SubProvider](./lib/src/sub_provider.dart).

## Custom SubProviders

You can directly use all of the inbuilt SubProviders in your tree.
It is also possible to extend SubProvider to create your own reusable SubProviders.

You can get access to `SingleChildSubValue` and other internal types by importing `package:flutter_sub_provider/developer.dart`.

To create a reusable SubProvider from our example earlier, we can do the following:

```dart
class PaginationControllerProvider extends SubProvider<HttpClient, PaginationController> {
  PaginationControllerProvider({
    super.child,
    super.builder,
  }) : super(
        create: (context, httpClient) => PaginationController(client: httpClient),
  );
}
```

## Inbuilt SubProviders

| Name                                                                    | Description                                                                                         |
| ----------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| [SubProvider](./lib/src/sub_provider.dart)                              | Creates a value based on a dependency and exposes it to its descendants.                            |
| [SubChangeNotifierProvider](./lib/src/sub_changenotifier_provider.dart) | Creates a `ChangeNotifier` based on a dependency and exposes it to its descendants.                 |
| [SubListenableProvider](./lib/src/sub_listenable_provider.dart)         | Creates a `Listenable` based on a dependency and exposes it to its descendants.                     |
| [SubFutureProvider](./lib/src/sub_future_provider.dart)                 | Creates and listens to a `Future` based on a dependency and exposes its result to its descendants.  |
| [SubStreamProvider](./lib/src/sub_stream_provider.dart)                 | Creates and listens to a `Stream` based on a dependency and exposes its content to its descendants. |

Each SubProvider comes in versions 0-6, which can manage the corresponding amount of dependencies, respectively.
