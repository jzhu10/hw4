import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:hw4/styles/sized_fill_button.dart';
import 'package:hw4/widgets/app_bar_home.dart';

class RouterLogin extends StatelessWidget {
  const RouterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(text: 'Login'),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedFillButton(
              text: 'Login',
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLoginEvent());
              },
            )
          ],
        ),
      ),
    );
  }
}
