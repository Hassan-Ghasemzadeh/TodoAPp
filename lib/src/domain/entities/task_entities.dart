import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  String title;
  String description;

  TaskEntity({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
