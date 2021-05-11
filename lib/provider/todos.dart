import 'package:fitness_app/models/todo_model.dart';
import 'package:flutter/cupertino.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      desc: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      desc: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}