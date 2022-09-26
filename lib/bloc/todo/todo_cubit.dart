// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/bloc/blocstatus.dart';
import 'package:todo_app/moduls/todo.dart';
import 'dart:core';

import '../../repository/TodoRebository/TodoRepository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());
  TodoRepository todoRepository = TodoRepository();

  void addTodo() async {
    emit(state.copyWith(blocStatus: BlocStatus.loading));
    try {
      todoRepository.storeData(Todo(
        id: state.id,
        title: state.title,
        description: state.description,
        priority: state.priority,
        status: state.status,
      ).toMap());
      emit(state.copyWith(blocStatus: BlocStatus.loaded));
    } catch (e) {
      emit(state.copyWith(blocStatus: BlocStatus.error));
      print(e);
    }


  void updateTodo(){
    emit(state.copyWith(blocStatus: BlocStatus.loading));
    try{
      todoRepository.updateData(state.id!, Todo(
        title: state.title,
        description: state.description,
        priority: state.priority,
        status: state.status,
      ).toMap());
      emit(state.copyWith(blocStatus: BlocStatus.updated));
    }
    catch(e){
      emit(state.copyWith(blocStatus: BlocStatus.error));
      print(e);
    }
  }


  void deleteTodo(){
      emit(state.copyWith(blocStatus: BlocStatus.loading));

      try{
        todoRepository.deleteData(state.id!);
        emit(state.copyWith(blocStatus: BlocStatus.deleted));
      }
      catch(e){
        emit(state.copyWith(blocStatus: BlocStatus.error));
        print(e);
      }
  }


  }


}
