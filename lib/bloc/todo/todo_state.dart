part of 'todo_cubit.dart';

class TodoState extends Equatable {
  int? id;
  String? title;
  String? description;
  Status? status;
  Priority? priority;
  BlocStatus? blocStatus= BlocStatus.initial;

  TodoState({
    this.id,
    this.title,
    this.description,
    this.status,
    this.priority,
    this.blocStatus,
  });

  @override
  List<dynamic> get props => [
    id,
    title,
    description,
    status,
    priority,
    blocStatus,];

  TodoState copyWith({
    int? id,
    String? title,
    String? description,
    Status? status,
    Priority? priority,
    BlocStatus? blocStatus,
  }) {
    return TodoState(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      blocStatus: blocStatus,
    );
  }
}
