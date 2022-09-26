import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/authentication/authentication_cubit.dart';
import 'package:todo_app/bloc/todo/todo_cubit.dart';
import 'package:todo_app/bloc/todo_list/todo_list_cubit.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'package:todo_app/screens/todo_list.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(create: (BuildContext context)=>TodoCubit()),
        BlocProvider<TodoListCubit>(create: (BuildContext context)=>TodoListCubit()),
        BlocProvider<AuthenticationCubit>(create: (BuildContext context)=>AuthenticationCubit(),),
      ],
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName : (ctx) => HomeScreen(),
          MainScreen.routeName : (ctx)=>MainScreen(),
          LoginScreen.routeName : (ctx)=>LoginScreen(),
          ToDoListScreen.routeName : (ctx)=>const ToDoListScreen(),
          TodoScreen.routeName : (ctx)=>const TodoScreen(),
          AddTodoScreen.routeName : (ctx)=>const AddTodoScreen(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (context) => const MainScreen()),
      ),
    );
  }
}