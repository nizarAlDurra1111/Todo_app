import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/add_todo_screen.dart';

import '../bloc/todo_list/todo_list_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String routeName = '/main_screen';

  @override
  Widget build(BuildContext context) {
    context.read<TodoListCubit>().loadTodoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          BlocBuilder<TodoListCubit, TodoListState>(
            builder: (context, state) {
              return Flexible(
                child: ListView.builder(
                    itemCount: state.todos?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.announcement),
                        title: Text(state.todos?[index].title ?? 'Todo'),
                        trailing: Text(
                          "${index + 1}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),
                        ),
                      );
                    }),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(AddTodoScreen.routeName);
        },
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.background,
      )
    );
  }
}
