import 'package:fitness_app/provider/todos.dart';
import 'package:fitness_app/widgets/todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty
        ? Center(
            child: Text("No Todos!!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))
        : ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (context, index) {
              return Container(height: 8);
            },
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            });
  }
}
