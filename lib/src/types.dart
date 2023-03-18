import 'package:flutter/widgets.dart';
import 'package:flutter_sub_provider/flutter_sub_provider.dart';

/// {@template subprovider.subprovidercreate}
/// Called to create the [Provider] of a [SubProvider].
/// {@endtemplate}
typedef SubProviderCreate<T, R> = R Function(
  BuildContext context,
  T value,
);

/// {@template subprovider.subproviderupdate}
/// Called to update the [Provider] of a [SubProvider].
/// {@endtemplate}
typedef SubProviderUpdate<T, R> = R Function(
  BuildContext context,
  T value,
  R previous,
);

/// {@macro subprovider.subprovidercreate}
typedef SubProviderCreate2<T, T2, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
);

/// {@macro subprovider.subproviderupdate}
typedef SubProviderUpdate2<T, T2, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  R previous,
);

/// {@macro subprovider.subprovidercreate}
typedef SubProviderCreate3<T, T2, T3, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
);

/// {@macro subprovider.subproviderupdate}
typedef SubProviderUpdate3<T, T2, T3, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  R previous,
);

/// {@macro subprovider.subprovidercreate}
typedef SubProviderCreate4<T, T2, T3, T4, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
);

/// {@macro subprovider.subproviderupdate}
typedef SubProviderUpdate4<T, T2, T3, T4, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  R previous,
);

/// {@macro subprovider.subprovidercreate}
typedef SubProviderCreate5<T, T2, T3, T4, T5, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
);

/// {@macro subprovider.subproviderupdate}
typedef SubProviderUpdate5<T, T2, T3, T4, T5, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
  R previous,
);

/// {@macro subprovider.subprovidercreate}
typedef SubProviderCreate6<T, T2, T3, T4, T5, T6, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
  T6 value6,
);

/// {@macro subprovider.subproviderupdate}
typedef SubProviderUpdate6<T, T2, T3, T4, T5, T6, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  T4 value4,
  T5 value5,
  T6 value6,
  R previous,
);
