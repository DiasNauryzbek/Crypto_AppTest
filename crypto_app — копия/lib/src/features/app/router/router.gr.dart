// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../../screens/home/CryptoArticle.dart' as _i2;
import '../../screens/home/CryptoHome.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CryptoHome.name: (routeData) {
      final args = routeData.argsAs<CryptoHomeArgs>(
          orElse: () => const CryptoHomeArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.CryptoHome(key: args.key),
      );
    },
    CryptoArticle.name: (routeData) {
      final args = routeData.argsAs<CryptoArticleArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CryptoArticle(
          key: args.key,
          cryptoId: args.cryptoId,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          CryptoHome.name,
          path: '/',
        ),
        _i3.RouteConfig(
          CryptoArticle.name,
          path: '/article',
        ),
      ];
}

/// generated route for
/// [_i1.CryptoHome]
class CryptoHome extends _i3.PageRouteInfo<CryptoHomeArgs> {
  CryptoHome({_i5.Key? key})
      : super(
          CryptoHome.name,
          path: '/',
          args: CryptoHomeArgs(key: key),
        );

  static const String name = 'CryptoHome';
}

class CryptoHomeArgs {
  const CryptoHomeArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'CryptoHomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CryptoArticle]
class CryptoArticle extends _i3.PageRouteInfo<CryptoArticleArgs> {
  CryptoArticle({
    _i5.Key? key,
    required String cryptoId,
  }) : super(
          CryptoArticle.name,
          path: '/article',
          args: CryptoArticleArgs(
            key: key,
            cryptoId: cryptoId,
          ),
        );

  static const String name = 'CryptoArticle';
}

class CryptoArticleArgs {
  const CryptoArticleArgs({
    this.key,
    required this.cryptoId,
  });

  final _i5.Key? key;

  final String cryptoId;

  @override
  String toString() {
    return 'CryptoArticleArgs{key: $key, cryptoId: $cryptoId}';
  }
}
