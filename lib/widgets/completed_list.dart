import 'package:fitness_app/provider/todos.dart';
import 'package:fitness_app/widgets/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No todos Completed!!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
