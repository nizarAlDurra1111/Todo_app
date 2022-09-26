import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/authentication/authentication_cubit.dart';

import '../../screens/login_screen.dart';
import '../../screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/home_page';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationCubit>();
    return BlocBuilder<AuthenticationCubit,AuthenticationState>(
      builder: (context, state) {
        if (state.authStatus == AuthStatus.auth) {
          return const MainScreen();
        } else {
          print()
          return const LoginScreen();
        }
      });
  }
}
