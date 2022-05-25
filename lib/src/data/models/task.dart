import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Task extends Equatable {
  String title;
  String description;
  String id;
  Task({this.title = '', this.description = '', required this.id});

  factory Task.unique({String title = '', String description = ''}) {
    final uuid = const Uuid().v4().toString();
    return Task(id: uuid, title: title, description: description);
  }

  String get getTitle {
    return title;
  }

  set setTitle(String title) {
    this.title = title;
  }

  String get getDescription {
    return description;
  }

  set setDescription(String description) {
    this.description = description;
  }

  @override
  List<Object?> get props => [title, description];
}
