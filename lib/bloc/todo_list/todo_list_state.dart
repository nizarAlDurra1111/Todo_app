part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {

  List<Todo>? todos = [];
  BlocStatus? blocStatus= BlocStatus.initial;


  TodoListState({this.todos,this.blocStatus});


  TodoListState copyWith({
    List<Todo>? todos,
    BlocStatus? blocStatus,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      blocStatus: blocStatus ?? this.blocStatus,
    );
  }

  @override
  List<dynamic> get props => [todos];
}

