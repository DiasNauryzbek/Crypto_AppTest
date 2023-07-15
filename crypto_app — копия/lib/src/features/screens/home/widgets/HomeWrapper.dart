import 'package:crypto_app/src/core/dependencies/gettIt.dart';
import 'package:crypto_app/src/features/screens/home/logic/bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeProviders extends StatelessWidget {
  const HomeProviders({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(CryptoData()),
        ),
       
      ],
      child: child,
    );
  }
}