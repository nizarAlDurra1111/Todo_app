import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/dummy_data.dart';
import 'package:todo_app/moduls/todo.dart';

import '../blocstatus.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState());
  
  void loadTodoList(){
    emit(state.copyWith(blocStatus: BlocStatus.loading));
    state.todos = todosDummy;
    emit(state.copyWith(blocStatus: BlocStatus.loaded));
  }
  void updateTodoList()
  {
    emit(state.copyWith(blocStatus: BlocStatus.loading));
    state.todos = todosDummy;
    emit(state.copyWith(blocStatus: BlocStatus.updated));
  }
}
