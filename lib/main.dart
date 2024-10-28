import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:hw4/navigation/bookclub_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authenticationBloc = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authenticationBloc..add(AuthenticationLoginEvent()),
      child: MaterialApp.router(
        title: 'hw4',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: bookclubRouter(authenticationBloc),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
